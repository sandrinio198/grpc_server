import 'package:either_dart/either.dart';
import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<User, Failed>> create(User user);
  Future<Either<List<User>, Failed>> all({String? query});
  Future<Either<bool, Failed>> deleteById(String id);
  Future<Either<User, Failed>> update(User user);
}
