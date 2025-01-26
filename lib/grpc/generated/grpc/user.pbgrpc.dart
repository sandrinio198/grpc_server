//
//  Generated code. Do not modify.
//  source: grpc/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('UserProtoService')
class UserProtoServiceClient extends $grpc.Client {
  static final _$createUser = $grpc.ClientMethod<$0.CreateUserRequest, $0.UserServiceResponse>(
      '/UserProtoService/CreateUser',
      ($0.CreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserServiceResponse.fromBuffer(value));
  static final _$getUsers = $grpc.ClientMethod<$0.GetUsersRequest, $0.UserServiceResponse>(
      '/UserProtoService/GetUsers',
      ($0.GetUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserServiceResponse.fromBuffer(value));
  static final _$deleteUserById = $grpc.ClientMethod<$0.DeleteUserByIdRequest, $0.UserServiceResponse>(
      '/UserProtoService/DeleteUserById',
      ($0.DeleteUserByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserServiceResponse.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateUserRequest, $0.UserServiceResponse>(
      '/UserProtoService/UpdateUser',
      ($0.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserServiceResponse.fromBuffer(value));

  UserProtoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserServiceResponse> createUser($0.CreateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserServiceResponse> getUsers($0.GetUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserServiceResponse> deleteUserById($0.DeleteUserByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUserById, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserServiceResponse> updateUser($0.UpdateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }
}

@$pb.GrpcServiceName('UserProtoService')
abstract class UserProtoServiceBase extends $grpc.Service {
  $core.String get $name => 'UserProtoService';

  UserProtoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUserRequest, $0.UserServiceResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserRequest.fromBuffer(value),
        ($0.UserServiceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUsersRequest, $0.UserServiceResponse>(
        'GetUsers',
        getUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUsersRequest.fromBuffer(value),
        ($0.UserServiceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserByIdRequest, $0.UserServiceResponse>(
        'DeleteUserById',
        deleteUserById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserByIdRequest.fromBuffer(value),
        ($0.UserServiceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserRequest, $0.UserServiceResponse>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserRequest.fromBuffer(value),
        ($0.UserServiceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserServiceResponse> createUser_Pre($grpc.ServiceCall call, $async.Future<$0.CreateUserRequest> request) async {
    return createUser(call, await request);
  }

  $async.Future<$0.UserServiceResponse> getUsers_Pre($grpc.ServiceCall call, $async.Future<$0.GetUsersRequest> request) async {
    return getUsers(call, await request);
  }

  $async.Future<$0.UserServiceResponse> deleteUserById_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteUserByIdRequest> request) async {
    return deleteUserById(call, await request);
  }

  $async.Future<$0.UserServiceResponse> updateUser_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.UserServiceResponse> createUser($grpc.ServiceCall call, $0.CreateUserRequest request);
  $async.Future<$0.UserServiceResponse> getUsers($grpc.ServiceCall call, $0.GetUsersRequest request);
  $async.Future<$0.UserServiceResponse> deleteUserById($grpc.ServiceCall call, $0.DeleteUserByIdRequest request);
  $async.Future<$0.UserServiceResponse> updateUser($grpc.ServiceCall call, $0.UpdateUserRequest request);
}
