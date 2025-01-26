// import 'dart:convert';

// import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:either_dart/either.dart';
import 'package:grpc/grpc.dart';
import 'package:niu_server/core/error/failed.dart';
// import 'package:niu_server/core/responses/failed_response.dart';
import 'package:niu_server/env.dart';
import 'package:niu_server/features/auth/presentation/verify_service.dart';
import 'package:niu_server/registrator.dart';

Future<GrpcError?> authInterceptor(
  ServiceCall call,
  ServiceMethod method,
) async {
  if (Env.excludedMethodsForAuthInterceptor.contains(method.name)) {
    return null;
  }

  final metadata = call.clientMetadata ?? {};
  final idToken = metadata['token'];

  if (idToken == null) {
    // final failedResponse = FailedResponse(
    //   message: 'Missing Auth Token',
    // );
    return GrpcError.unauthenticated(
      'Token not found',
    );
  }

  final Either<JWT, Failed> response = getIt<VerifyService>().verify(idToken);
  if (response.isRight) {
    return GrpcError.unauthenticated(
      'Invalid auth token',
    );
  }

  return null;
}
