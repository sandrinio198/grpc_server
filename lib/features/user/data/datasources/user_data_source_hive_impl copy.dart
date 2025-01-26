// import 'package:hive/hive.dart';
// import 'package:niu_server/boxes.dart';
// import 'package:niu_server/features/user/data/exceptions/exceptions.dart';
// // import 'package:niu_server/features/user/data/models/user_impl.dart';
// import 'package:niu_server/features/user/domain/datasources/user_data_source.dart';
// import 'package:niu_server/features/user/domain/entities/user.dart';
// import 'package:uuid/uuid.dart';

// class UserDataSourceHiveImpl implements UserDataSource {
//   @override
//   Future<void> create(User user) async {
//     late Box<User>? box;
//     user = user.copyWith(id: Uuid().v4());
//     try {
//       box = await userBox;

//       // Missing fields
//       if (user.email!.isEmpty ||
//           user.firstName!.isEmpty ||
//           user.lastName!.isEmpty) {
//         throw MissingFields(message: 'Missing fields');
//       }

//       // Check if user ID already exists
//       if (box.containsKey(user.id)) {
//         throw UserIdAlreadyExists(
//             message: 'User with ID ${user.id} already exists.');
//       }

//       // Check if email already exists
//       final existingUser = box.values.cast<User?>().firstWhere(
//             (u) => u?.email == user.email,
//             orElse: () => null,
//           );

//       if (existingUser != null) {
//         throw UserWithEmailAlreadyExists(
//             message: 'User with email ${user.email} already exists.');
//       }

//       // Save the user if validation passes
//       await box.put(user.id, user);

//       print('User with ID ${user.id} created successfully.');
//     } catch (e) {
//       // print('Error creating user: $e');
//       // print('Stack trace: $stackTrace');
//       rethrow; // Rethrow the exception for further handling
//     } finally {
//       if (box!.isOpen) {
//         await box.close();
//       }
//     }
//   }

//   @override
//   Future<List<User>> all({String? query}) async {
//     try {
//       final box = await userBox;
//       List<User> users = box.values.toList();

//       if (query != null && query.isNotEmpty) {
//         users = users.where((e) {
//           return e.email == query || e.id == query;
//         }).toList();
//       }

//       await box.close();
//       return users;
//     } catch (e) {
//       return [];
//     }
//   }

//   @override
//   Future<User?> findById(String id) async {
//     try {
//       final box = await userBox;
//       final user = box.get(id); // პირდაპირ ეძებს ID-ს key-ის მიხედვით
//       await box.close();
//       if (user == null) {
//         throw UserWithIdNotFound(
//           message: 'We did not found user by id $id',
//         );
//       }

//       return user;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> deleteById(String id) async {
//     try {
//       final box = await userBox;
//       if (box.containsKey(id)) {
//         await box.delete(id);
//         await box.close();
//       } else {
//         await box.close();
//         throw UserWithIdNotFound(
//           message: "We didn't found user by id: $id to delete it",
//         );
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> update(User user) async {
//     try {
//       final box = await userBox;
//       if (user.id != null) {
//         if (box.containsKey(user.id)) {
//           // Missing fields
//           if (user.email!.isEmpty ||
//               user.firstName!.isEmpty ||
//               user.lastName!.isEmpty) {
//             throw MissingFields(message: 'Missing fields');
//           }

//           // Check if email already exists
//           final existingUser = box.values.cast<User?>().firstWhere(
//                 (u) => u?.email == user.email && u?.id != user.id,
//                 orElse: () => null,
//               );

//           if (existingUser != null) {
//             throw UserWithEmailAlreadyExists(
//                 message: 'User with email ${user.email} already exists.');
//           }

//           await box.put(user.id, user);
//           await box.close();
//         } else {
//           await box.close();
//           throw UserWithIdNotFound(
//             message:
//                 'Error: User with ID ${user.id} does not exist. Cannot update',
//           );
//         }
//       } else {
//         await box.close();
//         throw UserIdIsNull(
//           message: 'Error: User ID is null. Cannot update user without an ID.',
//         );
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<User?> findByEmail(String email) async {
//     try {
//       final box = await userBox;

//       final User? user = box.values.cast<User?>().firstWhere(
//             (u) => u?.email == email,
//             orElse: () => null,
//           );

//       await box.close();

//       if (user == null) {
//         throw UserWithEmailNotFound(
//             message: 'We did not found user with email $email');
//       }

//       return user;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
