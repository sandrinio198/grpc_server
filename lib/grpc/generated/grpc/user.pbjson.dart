//
//  Generated code. Do not modify.
//  source: grpc/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userProtoDescriptor instead')
const UserProto$json = {
  '1': 'UserProto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `UserProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProtoDescriptor = $convert.base64Decode(
    'CglVc2VyUHJvdG8SDgoCaWQYASABKAlSAmlkEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIdCgpmaX'
    'JzdF9uYW1lGAMgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAQgASgJUghsYXN0TmFtZQ==');

@$core.Deprecated('Use protoExceptionDescriptor instead')
const ProtoException$json = {
  '1': 'ProtoException',
  '2': [
    {'1': 'exception', '3': 1, '4': 1, '5': 9, '10': 'exception'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ProtoException`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoExceptionDescriptor = $convert.base64Decode(
    'Cg5Qcm90b0V4Y2VwdGlvbhIcCglleGNlcHRpb24YASABKAlSCWV4Y2VwdGlvbhIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSHQoKZmlyc3RfbmFtZR'
    'gDIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgEIAEoCVIIbGFzdE5hbWU=');

@$core.Deprecated('Use getUsersRequestDescriptor instead')
const GetUsersRequest$json = {
  '1': 'GetUsersRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'query', '17': true},
  ],
  '8': [
    {'1': '_query'},
  ],
};

/// Descriptor for `GetUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2Vyc1JlcXVlc3QSGQoFcXVlcnkYASABKAlIAFIFcXVlcnmIAQFCCAoGX3F1ZXJ5');

@$core.Deprecated('Use getUserByIdRequestDescriptor instead')
const GetUserByIdRequest$json = {
  '1': 'GetUserByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetUserByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByIdRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VyQnlJZFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use getUserByEmailRequestDescriptor instead')
const GetUserByEmailRequest$json = {
  '1': 'GetUserByEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetUserByEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByEmailRequestDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyQnlFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');

@$core.Deprecated('Use deleteUserByIdRequestDescriptor instead')
const DeleteUserByIdRequest$json = {
  '1': 'DeleteUserByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteUserByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserByIdRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVVc2VyQnlJZFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'first_name', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFAoFZW1haWwYAiABKAlSBWVtYW'
    'lsEh0KCmZpcnN0X25hbWUYAyABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYBCABKAlSCGxh'
    'c3ROYW1l');

@$core.Deprecated('Use userServiceResponseDescriptor instead')
const UserServiceResponse$json = {
  '1': 'UserServiceResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
  ],
};

/// Descriptor for `UserServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userServiceResponseDescriptor = $convert.base64Decode(
    'ChNVc2VyU2VydmljZVJlc3BvbnNlEhoKCHJlc3BvbnNlGAEgASgJUghyZXNwb25zZQ==');

