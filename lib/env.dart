class Env {
  static int serverPort = 8000;
  static String jwtSecret =
      'dseNuqfrV00gIeOYaekG6auLCurich9e73bvBrALiiS2dJrAUvc8c7rCaYDZn32x';

  static String username = 'test';
  static String password = '1234';

  static List<String> excludedMethodsForAuthInterceptor = [
    'SignIn',
    'Verify',
  ];
}
