import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jsonwebtoken/src/jwt.dart';
import 'package:either_dart/src/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/auth/data/exceptions/invalid_credentials_exception.dart';
import 'package:niu_server/features/auth/domain/datasources/auth_datasource.dart';
import 'package:niu_server/features/auth/domain/entities/credentials.dart';
import 'package:niu_server/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource dataSource;
  AuthRepositoryImpl({required this.dataSource});
  @override
  Either<String, Failed> signIn(Credentials credentials) {
    try {
      final token = dataSource.signIn(credentials);
      return Left(token);
    } on InvalidCredentialsException catch (e) {
      return Right(Failed(exception: e, message: e.message));
    } catch (e) {
      return Right(Failed(message: e.toString()));
    }
  }

  @override
  Either<JWT, Failed> verify(String jwtToken) {
    try {
      final jwt = dataSource.verify(jwtToken);
      return Left(jwt);
    } on JWTExpiredException catch (e) {
      return Right(Failed(exception: e, message: e.message));
    } on JWTException catch (e) {
      return Right(Failed(exception: e, message: e.message));
    } catch (e) {
      return Right(Failed(message: e.toString()));
    }
  }
}
