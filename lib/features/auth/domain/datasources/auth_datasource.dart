import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:niu_server/features/auth/domain/entities/credentials.dart';

abstract class AuthDatasource {
  String signIn(Credentials credentials);
  JWT verify(String token);
}
