class UserIdIsNull implements Exception {
  final String? message;
  UserIdIsNull({this.message});
}

class UserIdAlreadyExists implements Exception {
  final String? message;
  UserIdAlreadyExists({this.message});
}

class MissingFields implements Exception {
  final String? message;
  MissingFields({this.message});
}

class UserWithEmailAlreadyExists implements Exception {
  final String? message;
  UserWithEmailAlreadyExists({this.message});
}

class UserWithIdNotFound implements Exception {
  final String? message;
  UserWithIdNotFound({this.message});
}

class UserWithEmailNotFound implements Exception {
  final String? message;
  UserWithEmailNotFound({this.message});
}
