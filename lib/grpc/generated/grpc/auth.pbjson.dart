//
//  Generated code. Do not modify.
//  source: grpc/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

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

@$core.Deprecated('Use authServiceResponseDescriptor instead')
const AuthServiceResponse$json = {
  '1': 'AuthServiceResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
  ],
};

/// Descriptor for `AuthServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authServiceResponseDescriptor = $convert.base64Decode(
    'ChNBdXRoU2VydmljZVJlc3BvbnNlEhoKCHJlc3BvbnNlGAEgASgJUghyZXNwb25zZQ==');

@$core.Deprecated('Use protoSignInCredentialsRequestDescriptor instead')
const ProtoSignInCredentialsRequest$json = {
  '1': 'ProtoSignInCredentialsRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ProtoSignInCredentialsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoSignInCredentialsRequestDescriptor = $convert.base64Decode(
    'Ch1Qcm90b1NpZ25JbkNyZWRlbnRpYWxzUmVxdWVzdBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm'
    '5hbWUSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use protoVerifyRequestDescriptor instead')
const ProtoVerifyRequest$json = {
  '1': 'ProtoVerifyRequest',
  '2': [
    {'1': 'jwtToken', '3': 1, '4': 1, '5': 9, '10': 'jwtToken'},
  ],
};

/// Descriptor for `ProtoVerifyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoVerifyRequestDescriptor = $convert.base64Decode(
    'ChJQcm90b1ZlcmlmeVJlcXVlc3QSGgoIand0VG9rZW4YASABKAlSCGp3dFRva2Vu');

