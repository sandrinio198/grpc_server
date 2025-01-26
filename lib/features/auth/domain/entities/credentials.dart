abstract class Credentials {
  final String username;
  final String password;
  Credentials({
    required this.username,
    required this.password,
  });

  factory Credentials.fromJson() =>
      throw UnimplementedError('Use implementation insted');
  Map toJson() => throw UnimplementedError('Use implementation insted');
}
