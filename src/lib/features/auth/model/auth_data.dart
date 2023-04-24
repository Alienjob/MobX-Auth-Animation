class AuthData {
  final bool isAuthorized;
  final String login;
  final String email;
  final String token;

  AuthData({
    required this.isAuthorized,
    required this.login,
    required this.email,
    required this.token,
  });
  factory AuthData.emty() {
    return AuthData(
      isAuthorized: false,
      login: '',
      email: '',
      token: '',
    );
  }
}
