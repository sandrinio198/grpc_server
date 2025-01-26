import 'package:niu_server/core/error/failed.dart';
import 'package:niu_server/core/exceptions/exceptions.dart';
// import 'package:niu_server/features/user/data/exceptions/exceptions.dart';
import 'package:niu_server/features/user/domain/datasources/user_data_source.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
import 'package:niu_server/features/user/domain/repositories/user_repository.dart';
import 'package:either_dart/either.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});

  @override
  Future<Either<User, Failed>> create(User user) async {
    try {
      final User newUser = await dataSource.create(user);
      return Left(newUser);
    } on DomainException catch (e) {
      return Right(Failed(
        message: e.message,
      ));
    } catch (e) {
      return Right(Failed(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<List<User>, Failed>> all({String? query}) async {
    try {
      return Left(await dataSource.all(query: query));
    } catch (e) {
      return Right(Failed(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<bool, Failed>> deleteById(String id) async {
    try {
      await dataSource.deleteById(id);
      return Left(true);
    } on DomainException catch (e) {
      return Right(Failed(
        message: e.message,
        exception: e,
      ));
    } catch (e) {
      return Right(Failed(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<User, Failed>> update(User user) async {
    try {
      final updatedUser = await dataSource.update(user);
      return Left(updatedUser);
    } on DomainException catch (e) {
      return Right(
        Failed(
          message: e.message,
          exception: e,
        ),
      );
    } catch (e) {
      return Right(Failed(
        message: e.toString(),
      ));
    }
  }
}
