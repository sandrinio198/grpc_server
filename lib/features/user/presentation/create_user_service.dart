import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
import 'package:niu_server/features/user/domain/repositories/user_repository.dart';

class CreateUserService {
  final UserRepository repository;
  CreateUserService({required this.repository});

  Future<Either<User, Failed>> create(User user) async {
    return await repository.create(user);
  }
}
