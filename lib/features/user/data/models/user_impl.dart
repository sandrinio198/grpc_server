import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:niu_server/grpc/generated/grpc/user.pb.dart';

part 'user_impl.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserImpl extends HiveObject implements User {
  @override
  @HiveField(0)
  final String? id;

  @override
  @HiveField(1)
  final String? email;

  @override
  @HiveField(2)
  final String? firstName;

  @override
  @HiveField(3)
  final String? lastName;

  UserImpl({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  @override
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
  }) =>
      UserImpl(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory UserImpl.fromJson(Map<String, dynamic> json) =>
      _$UserImplFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserImplToJson(this);

  @override
  UserProto get toUserProto => UserProto(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

  @override
  String toRawJson() => jsonEncode(toJson());

  @override
  UserProto get userProtoFromJson {
    return UserProto.fromJson(
        '{"1": "$id", "2": "$email", "3": "$firstName", "4": "$lastName"}');
  }

  @override
  bool get isUserFieldsValid =>
      email!.isNotEmpty && firstName!.isNotEmpty && lastName!.isNotEmpty;
}
