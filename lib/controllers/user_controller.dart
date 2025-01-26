// import 'package:niu_server/grpc/generated/grpc/user.pb.dart';
// import 'dart:convert';

import 'package:niu_server/core/responses/failed_response.dart';
import 'package:niu_server/core/responses/success_response.dart';
import 'package:niu_server/features/user/data/models/user_impl.dart';
import 'package:niu_server/features/user/domain/entities/user.dart';
import 'package:niu_server/features/user/presentation/create_user_service.dart';
import 'package:niu_server/features/user/presentation/delete_user_service.dart';
import 'package:niu_server/features/user/presentation/get_user_service.dart';
import 'package:niu_server/features/user/presentation/update_user_service.dart';
import 'package:niu_server/grpc/generated/grpc/user.pbgrpc.dart';
import 'package:niu_server/registrator.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

class UserServiceController extends UserProtoServiceBase {
  @override
  Future<UserServiceResponse> createUser(
    ServiceCall call,
    CreateUserRequest request,
  ) async {
    final source = await getIt<CreateUserService>().create(UserImpl(
      id: Uuid().v4(),
      email: request.email,
      firstName: request.firstName,
      lastName: request.lastName,
    ));

    if (source.isLeft) {
      return UserServiceResponse(
        response: SuccessResponse(
          message: 'Operation completed succesfully',
          data: source.left,
        ).toRawJson(),
      );
    }

    return UserServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }

  @override
  Future<UserServiceResponse> getUsers(
    ServiceCall call,
    GetUsersRequest request,
  ) async {
    final source = await getIt<GetUserService>().getList(query: request.query);

    // success
    if (source.isLeft) {
      return UserServiceResponse(
        response: SuccessResponse<List<User>>(
          message: 'users list fetched succesfully',
          data: source.left,
        ).toRawJson(),
      );
    }

    return UserServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }

  @override
  Future<UserServiceResponse> deleteUserById(
    ServiceCall call,
    DeleteUserByIdRequest request,
  ) async {
    final source = await getIt<DeleteUserService>().delete(request.id);

    if (source.isLeft) {
      return UserServiceResponse(
        response: SuccessResponse(message: 'Operation completed succesfully')
            .toRawJson(),
      );
    }

    return UserServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }

  @override
  Future<UserServiceResponse> updateUser(
    ServiceCall call,
    UpdateUserRequest request,
  ) async {
    final source = await getIt<UpdateUserService>().update(UserImpl(
      id: request.id,
      email: request.email,
      firstName: request.firstName,
      lastName: request.lastName,
    ));

    if (source.isLeft) {
      return UserServiceResponse(
        response: SuccessResponse(
          message: 'Operation completed succesfully',
          data: source.left,
        ).toRawJson(),
      );
    }

    return UserServiceResponse(
      response: FailedResponse(message: source.right.message!).toRawJson(),
    );
  }
}
