import 'package:grpc/grpc.dart';
// import 'package:niu_server/grpc/generated/grpc/auth.pbgrpc.dart';
import 'package:niu_server/grpc/generated/grpc/user.pbgrpc.dart';

void main() async {
  final channel = ClientChannel(
    'localhost',
    port: 8000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = UserProtoServiceClient(channel);
  // final authStub = AuthServiceClient(channel);

  // var response = await authStub.signIn(ProtoSignInCredentialsRequest(
  //   username: 'test',
  //   password: '1234',
  // ));

  // var response = await stub.getUserByEmail(
  //   GetUserByEmailRequest(email: 'schakhvashvili@outlook.com'),
  //   options: CallOptions(
  //       // metadata: {
  //       //   'token':
  //       //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoic2FuZHJvIiwibGFzdF9uYW1lIjoiY2hha2h2YXNodmlsaSIsImlhdCI6MTczNzY0ODQ4OSwiaXNzIjoiaHR0cHM6Ly9naXRodWIuY29tL2pvbmFzcm91c3NlbC9kYXJ0X2pzb253ZWJ0b2tlbiJ9.bQBzXKlRyuDxV1hJKr49KKVKzi0TIshgIiWb5VZpfnw'
  //       // },
  //       ),
  // );

  var response = await stub.getUsers(
    GetUsersRequest(),
    options: CallOptions(
      metadata: {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoic2FuZHJvIiwibGFzdF9uYW1lIjoiY2hha2h2YXNodmlsaSIsImlhdCI6MTczNzY0ODQ4OSwiaXNzIjoiaHR0cHM6Ly9naXRodWIuY29tL2pvbmFzcm91c3NlbC9kYXJ0X2pzb253ZWJ0b2tlbiJ9.bQBzXKlRyuDxV1hJKr49KKVKzi0TIshgIiWb5VZpfnw'
      },
    ),
  );

  print(response.response);
  // print('Response received: ${response.jwtToken}');

  await channel.shutdown();
}
