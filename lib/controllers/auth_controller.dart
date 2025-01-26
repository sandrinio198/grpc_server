// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:either_dart/either.dart';
import 'package:grpc/src/server/call.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/core/responses/failed_response.dart';
import 'package:niu_server/core/responses/success_response.dart';
import 'package:niu_server/features/auth/data/models/credentials_impl.dart';
import 'package:niu_server/features/auth/presentation/sign_in_service.dart';
import 'package:niu_server/features/auth/presentation/verify_service.dart';
// import 'package:niu_server/features/auth/presentation/verify_service.dart';
import 'package:niu_server/grpc/generated/grpc/auth.pbgrpc.dart';
import 'package:niu_server/registrator.dart';

class AuthServiceController extends AuthServiceBase {
  @override
  Future<AuthServiceResponse> signIn(
      ServiceCall call, ProtoSignInCredentialsRequest request) async {
    final Either<String, Failed> source = getIt<SignInService>().signIn(
      CredentialsImpl(
        username: request.username,
        password: request.password,
      ),
    );

    if (source.isLeft) {
      return AuthServiceResponse(
        response: SuccessResponse<String>(
          message: 'Token generated',
          data: source.left,
        ).toRawJson(),
      );
    }

    return AuthServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }

  @override
  Future<AuthServiceResponse> verify(
      ServiceCall call, ProtoVerifyRequest request) async {
    final Either<JWT, Failed> source =
        getIt<VerifyService>().verify(request.jwtToken);

    if (source.isLeft) {
      return AuthServiceResponse(
        response: SuccessResponse(message: 'Token is valid: authenticated')
            .toRawJson(),
      );
    }

    return AuthServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }
}
