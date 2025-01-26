import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:niu_server/env.dart';
import 'package:niu_server/features/auth/data/exceptions/invalid_credentials_exception.dart';
import 'package:niu_server/features/auth/domain/datasources/auth_datasource.dart';
import 'package:niu_server/features/auth/domain/entities/credentials.dart';

class AuthDataSourceJwtImpl implements AuthDatasource {
  @override
  String signIn(Credentials credentials) {
    // check if username and passwords matches records
    if (credentials.username != Env.username &&
        credentials.password != Env.password) {
      throw InvalidCredentialsException(
        message: 'Username or password not match records',
      );
    }

    final jwt = JWT(
      {
        'name': 'sandro',
        'last_name': 'chakhvashvili',
      },
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

    return jwt.sign(SecretKey(Env.jwtSecret));

    // return jwtHelper.createToken();
  }

  @override
  JWT verify(String token) {
    return JWT.verify(token, SecretKey(Env.jwtSecret));
  }
}
