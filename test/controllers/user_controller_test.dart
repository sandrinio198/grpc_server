// import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';
// import 'package:grpc/grpc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:niu_server/controllers/user_controller.dart';
import 'package:niu_server/core/responses/failed_response.dart';
// import 'package:niu_server/core/error/failed.dart';
// import 'package:niu_server/core/responses/failed_response.dart';
import 'package:niu_server/core/responses/success_response.dart';
import 'package:niu_server/features/user/data/datasources/user_data_source_hive_impl.dart';
// import 'package:niu_server/features/user/data/datasources/user_data_source_hive_impl.dart';
import 'package:niu_server/features/user/data/models/user_impl.dart';
import 'package:niu_server/features/user/data/repositories/user_repository_impl.dart';
// import 'package:niu_server/features/user/domain/datasources/user_data_source.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
import 'package:niu_server/features/user/presentation/create_user_service.dart';
import 'package:niu_server/features/user/presentation/delete_user_service.dart';
import 'package:niu_server/features/user/presentation/get_user_service.dart';
import 'package:niu_server/features/user/presentation/update_user_service.dart';
// import 'package:niu_server/features/user/presentation/delete_user_service.dart';
// import 'package:niu_server/features/user/presentation/get_user_service.dart';
// import 'package:niu_server/features/user/presentation/update_user_service.dart';
import 'package:niu_server/grpc/generated/grpc/user.pb.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;

// mocks
// class MockUserDataSource extends Mock implements UserDataSource {}
class MockServiceCall extends Mock implements ServiceCall {}

class MockBox extends Mock implements Box {}

final List<User> usersList = [
  UserImpl(
    id: '32d1ea0b-b147-41d7-bff1-e58c096c3a70',
    email: 'test1@gmail.com',
    firstName: 'name1',
    lastName: 'name1',
  ),
  UserImpl(
    id: '32d1ea0b-b147-41d7-bff1-e58c096c3a71',
    email: 'test2@gmail.com',
    firstName: 'name2',
    lastName: 'name2',
  ),
  UserImpl(
    id: '32d1ea0b-b147-41d7-bff1-e58c096c3a72',
    email: 'test3@gmail.com',
    firstName: 'name3',
    lastName: 'name3',
  ),
  UserImpl(
    id: '32d1ea0b-b147-41d7-bff1-e58c096c3a73',
    email: 'test4@gmail.com',
    firstName: 'name4',
    lastName: 'name4',
  ),
];

void main() {
  late MockBox mockBox;
  late UserServiceController userServiceController;
  setUpAll(() {
    registerFallbackValue(
      UserImpl(
        email: 'fallback_email',
        firstName: 'fallback_firstname',
        lastName: 'fallback_lastname',
      ),
    );
  });

  setUp(() {
    mockBox = MockBox();
    userServiceController = UserServiceController();

    getIt.registerFactory<CreateUserService>(
      () => CreateUserService(
        repository: UserRepositoryImpl(
          dataSource: UserDataSourceHiveImpl(box: mockBox),
        ),
      ),
    );

    getIt.registerFactory<GetUserService>(
      () => GetUserService(
        repository: UserRepositoryImpl(
          dataSource: UserDataSourceHiveImpl(box: mockBox),
        ),
      ),
    );

    getIt.registerFactory<UpdateUserService>(
      () => UpdateUserService(
        repository: UserRepositoryImpl(
          dataSource: UserDataSourceHiveImpl(box: mockBox),
        ),
      ),
    );

    getIt.registerFactory<DeleteUserService>(
      () => DeleteUserService(
        repository: UserRepositoryImpl(
          dataSource: UserDataSourceHiveImpl(box: mockBox),
        ),
      ),
    );
  });

  group('Successful CRUD Operations', () {
    test('Create a new user using the `CreateUser` method', () async {
      // Arrange
      final newUser = UserImpl(
        id: Uuid().v4(),
        email: 'test@gmail.com',
        firstName: 'testFirstName',
        lastName: 'testLastName',
      );

      when(
        () => mockBox.containsKey(
          any<dynamic>(),
        ),
      ).thenReturn(false);

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      when(
        () => mockBox.put(any<String>(), any<UserImpl>()),
      ).thenAnswer((_) async => {});

      when(
        () => mockBox.get(any<String>()),
      ).thenAnswer((_) async => newUser);

      // Act
      final UserServiceResponse serviceResponse =
          await userServiceController.createUser(
        MockServiceCall(),
        CreateUserRequest(
          email: newUser.email,
          firstName: newUser.firstName,
          lastName: newUser.lastName,
        ),
      );

      // Expect
      expect(
        serviceResponse,
        UserServiceResponse(
          response: SuccessResponse(
            message: 'Operation completed succesfully',
            data: newUser,
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.containsKey(
            any<dynamic>(),
          )).called(1);
      verify(() => mockBox.values).called(1);
      verify(() => mockBox.put(any<String>(), any<UserImpl>())).called(1);
      verify(() => mockBox.get(any<String>())).called(1);
    });

    test('Retrieve a list of users `ListUser` method.', () async {
      // Arrange
      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      // Act
      final UserServiceResponse response = await userServiceController.getUsers(
        MockServiceCall(),
        GetUsersRequest(query: null),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse<List<User>>(
            message: 'users list fetched succesfully',
            data: usersList,
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.values).called(1);
    });

    test('Retrieve a user by ID filter using the `ListUser` method', () async {
      // Arrange
      final String queryId = '32d1ea0b-b147-41d7-bff1-e58c096c3a71';

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      // Act
      final UserServiceResponse response = await userServiceController.getUsers(
        MockServiceCall(),
        GetUsersRequest(query: queryId),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse<List<User>>(
            message: 'users list fetched succesfully',
            data: usersList.where((e) => e.id == queryId).toList(),
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.values).called(1);
    });

    test('Retrieve a user by Email filter using the `ListUser` method',
        () async {
      // Arrange
      final String email = 'test3@gmail.com';

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      // Act
      final UserServiceResponse response = await userServiceController.getUsers(
        MockServiceCall(),
        GetUsersRequest(query: email),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse<List<User>>(
            message: 'users list fetched succesfully',
            data: usersList.where((e) => e.email == email).toList(),
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.values).called(1);
    });

    test('Update an existing user using the `UpdateUser` method', () async {
      // Arrange
      final updatedUser = usersList.first.copyWith(
        email: 'updatedEmail@gmail.com',
      );
      when(
        () => mockBox.containsKey(
          any<dynamic>(),
        ),
      ).thenReturn(true);

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      when(
        () => mockBox.put(any<String>(), any<UserImpl>()),
      ).thenAnswer((_) async => {});
      // Act
      final UserServiceResponse response =
          await userServiceController.updateUser(
        MockServiceCall(),
        UpdateUserRequest(
          id: updatedUser.id,
          email: updatedUser.email,
          firstName: updatedUser.firstName,
          lastName: updatedUser.lastName,
        ),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse(
            message: 'Operation completed succesfully',
            data: updatedUser,
          ).toRawJson(),
        ),
      );
      verify(() => mockBox.containsKey(
            any<dynamic>(),
          )).called(1);
      verify(() => mockBox.values).called(1);
      verify(() => mockBox.put(any<String>(), any<UserImpl>())).called(1);
    });

    test("Delete a user by ID using the `DeleteUser` method.", () async {
      // Arrange
      when(
        () => mockBox.containsKey(
          any<dynamic>(),
        ),
      ).thenReturn(true);
      when(
        () => mockBox.delete(any<String>()),
      ).thenAnswer((_) async => {});

      // Act
      final UserServiceResponse response =
          await userServiceController.deleteUserById(
        MockServiceCall(),
        DeleteUserByIdRequest(
          id: 'some_id',
        ),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse(
            message: 'Operation completed succesfully',
          ).toRawJson(),
        ),
      );
      verify(() => mockBox.containsKey(any<dynamic>())).called(1);
      verify(() => mockBox.delete(any<String>())).called(1);
    });

    tearDown(() {
      getIt.reset();
    });
  });

  group('Failed CRUD Operations', () {
    test(
        'Attempt to create a new user with invalid data (e.g., missing fields)',
        () async {
      // Arrange
      final newUser = UserImpl(
        id: Uuid().v4(),
        email: 'test@gmail.com',
        firstName: 'some name',
      );

      // Act
      final UserServiceResponse serviceResponse =
          await userServiceController.createUser(
        MockServiceCall(),
        CreateUserRequest(
          email: newUser.email,
          firstName: newUser.firstName,
          lastName: newUser.lastName,
        ),
      );

      // Expect
      expect(
        serviceResponse,
        UserServiceResponse(
          response: FailedResponse(
            message: 'Missing fields',
          ).toRawJson(),
        ),
      );
    });

    test(
        'Attempt to create a new user with invalid data (Email already exists)',
        () async {
      // Arrange
      final newUser = UserImpl(
        id: Uuid().v4(),
        email: 'test3@gmail.com',
        firstName: 'sandro',
        lastName: 'sandrooo',
      );

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      when(
        () => mockBox.containsKey(any<String>()),
      ).thenReturn(false);

      // Act
      final UserServiceResponse serviceResponse =
          await userServiceController.createUser(
        MockServiceCall(),
        CreateUserRequest(
          email: newUser.email,
          firstName: newUser.firstName,
          lastName: newUser.lastName,
        ),
      );

      // Expect
      expect(
        serviceResponse,
        UserServiceResponse(
          response: FailedResponse(
            message: 'User with Email already exists.',
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.values).called(1);
    });

    test('Try to retrieve a List of users with an invalid filter.', () async {
      // Arrange
      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      // Act
      final UserServiceResponse response = await userServiceController.getUsers(
        MockServiceCall(),
        GetUsersRequest(query: 'some_query'),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: SuccessResponse<List<User>>(
            message: 'users list fetched succesfully',
            data: [],
          ).toRawJson(),
        ),
      );

      verify(() => mockBox.values).called(1);
    });

    test(
        'Update an existing user with invalid data (e.g., changing the email address).',
        () async {
      // Arrange
      final updatedUser = UserImpl(
        id: Uuid().v4(),
        email: 'test4@gmail.com', // existing email in list
        firstName: 'new first name',
        lastName: 'new last name',
      );

      when(
        () => mockBox.containsKey(
          any<dynamic>(),
        ),
      ).thenReturn(true);

      when(
        () => mockBox.values,
      ).thenReturn(usersList);

      // Act
      final UserServiceResponse response =
          await userServiceController.updateUser(
        MockServiceCall(),
        UpdateUserRequest(
          id: updatedUser.id,
          email: updatedUser.email,
          firstName: updatedUser.firstName,
          lastName: updatedUser.lastName,
        ),
      );

      expect(
        response,
        UserServiceResponse(
          response: FailedResponse(
            message: 'User with email already exists.',
          ).toRawJson(),
        ),
      );
      verify(() => mockBox.containsKey(
            any<dynamic>(),
          )).called(1);
      verify(() => mockBox.values).called(1);
    });

    test('Delete a user that does not exist', () async {
      // Arrange
      when(
        () => mockBox.containsKey(
          any<dynamic>(),
        ),
      ).thenReturn(false);

      // Act
      final UserServiceResponse response =
          await userServiceController.deleteUserById(
        MockServiceCall(),
        DeleteUserByIdRequest(
          id: 'some_id',
        ),
      );

      // Expect
      expect(
        response,
        UserServiceResponse(
          response: FailedResponse(
            message: "We didn't find a user ID to delete.",
          ).toRawJson(),
        ),
      );
      verify(() => mockBox.containsKey(any<dynamic>())).called(1);
    });

    tearDown(() {
      getIt.reset();
    });
  });
}
