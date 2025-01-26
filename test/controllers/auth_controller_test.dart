import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:niu_server/controllers/auth_controller.dart';
import 'package:niu_server/core/responses/success_response.dart';
import 'package:niu_server/env.dart';
import 'package:niu_server/features/auth/data/datasources/auth_data_source_jwt_impl.dart';
import 'package:niu_server/features/auth/data/models/credentials_impl.dart';
import 'package:niu_server/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:niu_server/features/auth/presentation/sign_in_service.dart';
import 'package:niu_server/features/auth/presentation/verify_service.dart';
import 'package:niu_server/grpc/generated/grpc/auth.pbgrpc.dart';
// import 'package:niu_server/grpc/generated/grpc/user.pb.dart';
import 'package:test/test.dart';

final getIt = GetIt.instance;

class MockServiceCall extends Mock implements ServiceCall {}

void main() {
  group('Authentication', () {
    late AuthServiceController authServiceController;

    setUpAll(() {
      registerFallbackValue(
        CredentialsImpl(username: 'fallback_user', password: 'fallback_pass'),
      );
    });

    setUp(() {
      authServiceController = AuthServiceController();
      // mockJwtUtils = MockJwtUtils();
      getIt.registerFactory<SignInService>(
        () => SignInService(
          repository: AuthRepositoryImpl(
            dataSource: AuthDataSourceJwtImpl(),
          ),
        ),
      );
      getIt.registerFactory<VerifyService>(
        () => VerifyService(
          repository: AuthRepositoryImpl(
            dataSource: AuthDataSourceJwtImpl(),
          ),
        ),
      );
    });

    tearDown(() {
      getIt.reset();
    });

    test(
        'Send requests without a valid JWT token and verify that authentication fails',
        () async {
      // Arrange
      final String invalidToken = 'invalid_token';

      final AuthServiceResponse verifyResponse =
          await authServiceController.verify(
        MockServiceCall(),
        ProtoVerifyRequest(jwtToken: invalidToken),
      );

      final decodedResponse = jsonDecode(verifyResponse.response);

      // Expect
      expect(
        decodedResponse['status'],
        equals('failed'),
      );
    });

    test(
        'Send requests wit a valid JWT token and verify that authentication succeded',
        () async {
      // Arrange
      // Act
      final AuthServiceResponse signInResponse =
          await authServiceController.signIn(
        MockServiceCall(),
        ProtoSignInCredentialsRequest(
          username: Env.username,
          password: Env.password,
        ),
      );

      final String generatedJwtToken =
          jsonDecode(signInResponse.response)['data'];

      final AuthServiceResponse verifyResponse =
          await authServiceController.verify(
        MockServiceCall(),
        ProtoVerifyRequest(jwtToken: generatedJwtToken),
      );

      // Expect
      expect(
        verifyResponse,
        AuthServiceResponse(
          response: SuccessResponse(
            message: 'Token is valid: authenticated',
          ).toRawJson(),
        ),
      );
    });
  });
}
