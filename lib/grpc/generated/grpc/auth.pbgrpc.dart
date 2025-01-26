//
//  Generated code. Do not modify.
//  source: grpc/auth.proto
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

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$signIn = $grpc.ClientMethod<$0.ProtoSignInCredentialsRequest, $0.AuthServiceResponse>(
      '/AuthService/SignIn',
      ($0.ProtoSignInCredentialsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthServiceResponse.fromBuffer(value));
  static final _$verify = $grpc.ClientMethod<$0.ProtoVerifyRequest, $0.AuthServiceResponse>(
      '/AuthService/Verify',
      ($0.ProtoVerifyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthServiceResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthServiceResponse> signIn($0.ProtoSignInCredentialsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthServiceResponse> verify($0.ProtoVerifyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify, request, options: options);
  }
}

@$pb.GrpcServiceName('AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ProtoSignInCredentialsRequest, $0.AuthServiceResponse>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProtoSignInCredentialsRequest.fromBuffer(value),
        ($0.AuthServiceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProtoVerifyRequest, $0.AuthServiceResponse>(
        'Verify',
        verify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProtoVerifyRequest.fromBuffer(value),
        ($0.AuthServiceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthServiceResponse> signIn_Pre($grpc.ServiceCall call, $async.Future<$0.ProtoSignInCredentialsRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.AuthServiceResponse> verify_Pre($grpc.ServiceCall call, $async.Future<$0.ProtoVerifyRequest> request) async {
    return verify(call, await request);
  }

  $async.Future<$0.AuthServiceResponse> signIn($grpc.ServiceCall call, $0.ProtoSignInCredentialsRequest request);
  $async.Future<$0.AuthServiceResponse> verify($grpc.ServiceCall call, $0.ProtoVerifyRequest request);
}
