import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/user/domain/repositories/user_repository.dart';

class DeleteUserService {
  final UserRepository repository;
  DeleteUserService({required this.repository});

  Future<Either<bool, Failed>> delete(String userId) async {
    return await repository.deleteById(userId);
  }
}
