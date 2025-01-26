import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:niu_server/boxes.dart';
import 'package:niu_server/features/auth/data/datasources/auth_data_source_jwt_impl.dart';
import 'package:niu_server/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:niu_server/features/auth/presentation/sign_in_service.dart';
import 'package:niu_server/features/auth/presentation/verify_service.dart';
import 'package:niu_server/features/user/data/datasources/user_data_source_hive_impl.dart';
import 'package:niu_server/features/user/data/models/user_impl.dart';
import 'package:niu_server/features/user/data/repositories/user_repository_impl.dart';
import 'package:niu_server/features/user/presentation/create_user_service.dart';
import 'package:niu_server/features/user/presentation/delete_user_service.dart';
import 'package:niu_server/features/user/presentation/get_user_service.dart';
import 'package:niu_server/features/user/presentation/update_user_service.dart';

final getIt = GetIt.instance;
final path = Directory.current.path;

void hiveAdapterRegistrator() {
  Hive
    ..init(path)
    ..registerAdapter(UserImplAdapter());
}

void getItRegistrator() async {
  final box = await userBox;

  // Create user
  getIt.registerFactory<CreateUserService>(
    () => CreateUserService(
      repository: UserRepositoryImpl(
        dataSource: UserDataSourceHiveImpl(box: box),
      ),
    ),
  );

  // Delete user
  getIt.registerFactory<DeleteUserService>(
    () => DeleteUserService(
      repository: UserRepositoryImpl(
        dataSource: UserDataSourceHiveImpl(box: box),
      ),
    ),
  );

  // Get user service
  getIt.registerFactory<GetUserService>(
    () => GetUserService(
      repository: UserRepositoryImpl(
        dataSource: UserDataSourceHiveImpl(box: box),
      ),
    ),
  );

  // Update user service
  getIt.registerFactory<UpdateUserService>(
    () => UpdateUserService(
      repository: UserRepositoryImpl(
        dataSource: UserDataSourceHiveImpl(box: box),
      ),
    ),
  );

  getIt.registerFactory<SignInService>(
    () => SignInService(
      repository: AuthRepositoryImpl(
        dataSource: AuthDataSourceJwtImpl(),
      ),
    ),
  );

  getIt.registerFactory<VerifyService>(
    () => VerifyService(
      repository: AuthRepositoryImpl(
        dataSource: AuthDataSourceJwtImpl(),
      ),
    ),
  );
}
