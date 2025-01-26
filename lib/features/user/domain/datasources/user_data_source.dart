import 'package:niu_server/features/user/domain/entities/user.dart';

abstract class UserDataSource {
  Future<void> deleteById(String id);

  Future<List<User>> all({String? query});
  Future<User> create(User user);
  Future<User> update(User user);
}
