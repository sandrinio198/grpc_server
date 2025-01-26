import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/auth/domain/repositories/auth_repository.dart';

class VerifyService {
  final AuthRepository repository;
  VerifyService({required this.repository});

  // returns token
  Either<JWT, Failed> verify(String jwtToken) {
    return repository.verify(jwtToken);
  }
}
