import 'package:hive/hive.dart';
import 'package:niu_server/core/exceptions/exceptions.dart';
import 'package:niu_server/features/user/domain/datasources/user_data_source.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
// import 'package:uuid/uuid.dart';

class UserDataSourceHiveImpl implements UserDataSource {
  final Box box;
  UserDataSourceHiveImpl({required this.box});

  /// Creates a new user and saves it to the user box.
  ///
  /// A unique ID is generated for the user before saving. The method performs
  /// validation to ensure all required fields are present and that there are no
  /// duplicate users based on ID or email.
  ///
  /// Throws a [DomainException] if:
  /// - Required fields are missing.
  /// - A user with the same ID already exists.
  /// - A user with the same email already exists.
  ///
  /// - [user]: The `User` object to be created.
  ///
  /// Returns: A `Future` that completes when the user is successfully created.
  @override
  Future<User> create(User user) async {
    // Open the user box
    // final box = await userBox;

    // Generate a unique ID for the user
    // final newUser = user.copyWith(id: Uuid().v4());

    // Validate user fields
    if (!user.isUserFieldsValid) {
      throw DomainException(message: 'Missing fields');
    }

    // Check for duplicate user by ID
    if (box.containsKey(user.id)) {
      throw DomainException(
        message: 'User with ID ${user.id} already exists.',
      );
    }

    // Check for duplicate user by email
    final isEmailDuplicate =
        box.values.any((existingUser) => existingUser.email == user.email);
    if (isEmailDuplicate) {
      throw DomainException(
        message: 'User with Email already exists.',
      );
    }

    // Save the validated user
    await box.put(user.id, user);
    // print('User with ID ${user.id} created successfully.');

    // Close the box if it is open
    // if (box.isOpen) {
    //   await box.close();
    // }

    return await box.get(user.id);
  }

  /// Retrieves a list of users from the user box.
  ///
  /// If a [query] is provided, the list is filtered to include only users
  /// whose email or ID matches the query. Otherwise, all users are returned.
  ///
  /// The user box is closed after the operation is completed.
  ///
  /// - [query]: An optional string used to filter users by email or ID.
  ///
  /// Returns: A `Future` containing a list of `User` objects.
  @override
  Future<List<User>> all({String? query}) async {
    final users = query?.isNotEmpty == true
        ? box.values
            .where((user) => user.email == query || user.id == query)
            .cast<User>()
            .toList()
        : box.values.cast<User>().toList();
    return users;
  }

  /// Updates an existing user in the data store.
  ///
  /// This method performs several validation checks before updating:
  /// - Ensures the user ID is not null.
  /// - Checks if a user with the given ID exists.
  /// - Validates that all required user fields are provided.
  /// - Prevents duplicate users with the same email but different IDs.
  ///
  /// Throws a [DomainException] in the following cases:
  /// - If the user ID is null.
  /// - If the user with the given ID does not exist.
  /// - If any required fields are missing.
  /// - If another user with the same email already exists.
  ///
  /// - [user]: The `User` object containing updated information.
  ///
  /// Returns: The updated `User` object after successful storage.
  @override
  Future<User> update(User user) async {
    // Validate that the user has a valid ID
    if (user.id == null) {
      throw DomainException(
        message: 'Error: User ID is null. Cannot update user without an ID.',
      );
    }

    // Check if a user with the given ID exists
    if (!box.containsKey(user.id)) {
      throw DomainException(
        message:
            'Error: User with ID ${user.id} does not exist. Cannot update.',
      );
    }

    // Ensure all required fields are valid
    if (!user.isUserFieldsValid) {
      throw DomainException(
        message: 'Missing fields.',
      );
    }

    // Check for duplicate email among other users
    final hasDuplicateEmail = box.values.any(
      (existingUser) =>
          existingUser.email == user.email && existingUser.id != user.id,
    );
    if (hasDuplicateEmail) {
      throw DomainException(
        message: 'User with email already exists.',
      );
    }

    // Save the updated user to the data store
    await box.put(user.id, user);

    // Return the updated user
    return user;
  }

  /// Deletes a user from the data store by their ID.
  ///
  /// This method performs a validation to ensure that a user with the given ID
  /// exists in the data store before attempting deletion.
  ///
  /// Throws a [DomainException] if:
  /// - No user with the specified ID is found.
  ///
  /// - [id]: The ID of the user to be deleted.
  ///
  /// Returns: A `Future` that completes when the user is successfully deleted.
  @override
  Future<void> deleteById(String id) async {
    // Check if the user with the given ID exists
    if (!box.containsKey(id)) {
      throw DomainException(
        message: "We didn't find a user ID to delete.",
      );
    }

    // Perform the deletion
    await box.delete(id);
  }
}
