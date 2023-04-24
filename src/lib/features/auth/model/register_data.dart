class RegisterData {
  final String login;
  final String email;
  final String password;

  RegisterData({
    required this.login,
    required this.email,
    required this.password,
  });
  factory RegisterData.emty() {
    return RegisterData(
      login: '',
      email: '',
      password: '',
    );
  }
}
