import 'package:niu_server/controllers/auth_controller.dart';
import 'package:niu_server/controllers/user_controller.dart';
import 'package:niu_server/core/interceptors/jwt_interceptor.dart';
import 'package:niu_server/env.dart';
import 'package:niu_server/registrator.dart';
import 'package:grpc/grpc.dart';

void main() async {
  hiveAdapterRegistrator();
  getItRegistrator();
  final server = Server.create(
    services: [
      UserServiceController(),
      AuthServiceController(),
    ],
    interceptors: [authInterceptor],
  );
  await server.serve(port: Env.serverPort);
  print("Server listening on port ${server.port}");
}
