import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/auth/domain/entities/credentials.dart';
import 'package:niu_server/features/auth/domain/repositories/auth_repository.dart';

class SignInService {
  final AuthRepository repository;
  SignInService({required this.repository});

  // returns token
  Either<String, Failed> signIn(Credentials credentials) {
    return repository.signIn(credentials);
  }
}
