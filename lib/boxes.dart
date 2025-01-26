import 'package:hive/hive.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';

Future<Box<User>> get userBox async {
  try {
    return await Hive.openBox<User>('users');
  } catch (e) {
    print('Error opening user box: $e');
    rethrow;
  }
}
