import 'package:mobx_auth_animation/features/auth/model/auth_failure.dart';

String? checkEmail(String email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return (emailValid) ? null : AuthFailureEmailIsInvalid().message;
}

String? checkLogin(String login) {
  final bool loginValid =
      login.isNotEmpty && RegExp(r"^[a-zA-Z0-9]+").hasMatch(login);
  return (loginValid) ? null : AuthFailureLoginIsInvalid().message;
}

String? checkPassword(String password) {
  final bool passwordValid = password.isNotEmpty;
  return (passwordValid) ? null : AuthFailurePasswordIsEmpty().message;
}
