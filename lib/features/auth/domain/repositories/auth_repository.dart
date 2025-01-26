import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/auth/domain/entities/credentials.dart';

abstract class AuthRepository {
  Either<String, Failed> signIn(Credentials credentials);
  Either<JWT, Failed> verify(String jwtToken);
}
