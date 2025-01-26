// import 'package:niu_server/core/error/failed.dart';
// import 'package:niu_server/features/user/data/exceptions/exceptions.dart';
// import 'package:niu_server/features/user/domain/datasources/user_data_source.dart';
// import 'package:niu_server/features/user/domain/entities/user.dart';
// import 'package:niu_server/features/user/domain/repositories/user_repository.dart';
// import 'package:either_dart/either.dart';

// class UserRepositoryImpl implements UserRepository {
//   final UserDataSource dataSource;
//   UserRepositoryImpl({required this.dataSource});

//   @override
//   Future<Either<bool, Failed>> create(User user) async {
//     try {
//       await dataSource.create(user);
//       return Left(true);
//     } on UserIdAlreadyExists catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } on UserWithEmailAlreadyExists catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } on MissingFields catch (e) {
//       return Right(Failed(message: e.message, exception: e));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<List<User>, Failed>> all({String? query}) async {
//     try {
//       return Left(await dataSource.all(query: query));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<User, Failed>> findById(String id) async {
//     try {
//       final User? user = await dataSource.findById(id);
//       return Left(user!);
//     } on UserWithIdNotFound catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<User, Failed>> findByEmail(String email) async {
//     try {
//       final User? user = await dataSource.findByEmail(email);
//       return Left(user!);
//     } on UserWithEmailNotFound catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<bool, Failed>> deleteById(String id) async {
//     try {
//       await dataSource.deleteById(id);
//       return Left(true);
//     } on UserWithIdNotFound catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<bool, Failed>> update(User user) async {
//     try {
//       await dataSource.update(user);
//       return Left(true);
//     } on MissingFields catch (e) {
//       return Right(
//         Failed(
//           message: e.message,
//           exception: e,
//         ),
//       );
//     } on UserWithIdNotFound catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } on UserIdIsNull catch (e) {
//       return Right(Failed(
//         message: e.message,
//         exception: e,
//       ));
//     } catch (e) {
//       return Right(Failed(
//         message: e.toString(),
//       ));
//     }
//   }
// }
