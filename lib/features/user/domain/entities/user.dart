import 'package:niu_server/grpc/generated/grpc/user.pb.dart';

abstract class User {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
  });

  bool get isUserFieldsValid =>
      throw UnimplementedError('Use user implementation instead');

  factory User.fromJson(Map<String, dynamic> json) =>
      throw UnimplementedError('Use user implementation instead');

  Map<String, dynamic> toJson() =>
      throw UnimplementedError('Use user implementation instead');

  UserProto get toUserProto =>
      throw UnimplementedError('Use user implementation instead');

  UserProto get userProtoFromJson =>
      throw UnimplementedError('Use user implementation instead');

  String toRawJson() =>
      throw UnimplementedError('Use user implementation instead');
}
