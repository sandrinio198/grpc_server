//
//  Generated code. Do not modify.
//  source: grpc/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProtoException extends $pb.GeneratedMessage {
  factory ProtoException({
    $core.String? exception,
    $core.String? message,
  }) {
    final $result = create();
    if (exception != null) {
      $result.exception = exception;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ProtoException._() : super();
  factory ProtoException.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoException.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoException', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'exception')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoException clone() => ProtoException()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoException copyWith(void Function(ProtoException) updates) => super.copyWith((message) => updates(message as ProtoException)) as ProtoException;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoException create() => ProtoException._();
  ProtoException createEmptyInstance() => create();
  static $pb.PbList<ProtoException> createRepeated() => $pb.PbList<ProtoException>();
  @$core.pragma('dart2js:noInline')
  static ProtoException getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoException>(create);
  static ProtoException? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get exception => $_getSZ(0);
  @$pb.TagNumber(1)
  set exception($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasException() => $_has(0);
  @$pb.TagNumber(1)
  void clearException() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class AuthServiceResponse extends $pb.GeneratedMessage {
  factory AuthServiceResponse({
    $core.String? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  AuthServiceResponse._() : super();
  factory AuthServiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthServiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthServiceResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'response')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthServiceResponse clone() => AuthServiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthServiceResponse copyWith(void Function(AuthServiceResponse) updates) => super.copyWith((message) => updates(message as AuthServiceResponse)) as AuthServiceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthServiceResponse create() => AuthServiceResponse._();
  AuthServiceResponse createEmptyInstance() => create();
  static $pb.PbList<AuthServiceResponse> createRepeated() => $pb.PbList<AuthServiceResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthServiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthServiceResponse>(create);
  static AuthServiceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get response => $_getSZ(0);
  @$pb.TagNumber(1)
  set response($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => clearField(1);
}

class ProtoSignInCredentialsRequest extends $pb.GeneratedMessage {
  factory ProtoSignInCredentialsRequest({
    $core.String? username,
    $core.String? password,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  ProtoSignInCredentialsRequest._() : super();
  factory ProtoSignInCredentialsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoSignInCredentialsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoSignInCredentialsRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoSignInCredentialsRequest clone() => ProtoSignInCredentialsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoSignInCredentialsRequest copyWith(void Function(ProtoSignInCredentialsRequest) updates) => super.copyWith((message) => updates(message as ProtoSignInCredentialsRequest)) as ProtoSignInCredentialsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoSignInCredentialsRequest create() => ProtoSignInCredentialsRequest._();
  ProtoSignInCredentialsRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoSignInCredentialsRequest> createRepeated() => $pb.PbList<ProtoSignInCredentialsRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoSignInCredentialsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoSignInCredentialsRequest>(create);
  static ProtoSignInCredentialsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class ProtoVerifyRequest extends $pb.GeneratedMessage {
  factory ProtoVerifyRequest({
    $core.String? jwtToken,
  }) {
    final $result = create();
    if (jwtToken != null) {
      $result.jwtToken = jwtToken;
    }
    return $result;
  }
  ProtoVerifyRequest._() : super();
  factory ProtoVerifyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoVerifyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoVerifyRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jwtToken', protoName: 'jwtToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoVerifyRequest clone() => ProtoVerifyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoVerifyRequest copyWith(void Function(ProtoVerifyRequest) updates) => super.copyWith((message) => updates(message as ProtoVerifyRequest)) as ProtoVerifyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoVerifyRequest create() => ProtoVerifyRequest._();
  ProtoVerifyRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoVerifyRequest> createRepeated() => $pb.PbList<ProtoVerifyRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoVerifyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoVerifyRequest>(create);
  static ProtoVerifyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwtToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwtToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJwtToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwtToken() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
