import 'package:niu_server/features/auth/domain/entities/credentials.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'credentials_impl.g.dart';

@JsonSerializable()
class CredentialsImpl extends Credentials {
  CredentialsImpl({required super.username, required super.password});

  factory CredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$CredentialsImplFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CredentialsImplToJson(this);
}
