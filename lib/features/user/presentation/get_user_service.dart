import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
import 'package:niu_server/features/user/domain/repositories/user_repository.dart';

class GetUserService {
  final UserRepository repository;
  GetUserService({required this.repository});

  // Future<Either<User, Failed>> findById(String userId) async {
  //   return await repository.findById(userId);
  // }

  // Future<Either<User, Failed>> findByEmail(String email) async {
  //   return await repository.findByEmail(email);
  // }

  // Query: id or email filter
  Future<Either<List<User>, Failed>> getList({String? query}) async {
    return await repository.all(query: query);
  }
}
