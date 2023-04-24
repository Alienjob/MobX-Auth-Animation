abstract class AuthFailure {
  String get message;
}

class AuthFailureEmailIsInvalid implements AuthFailure {
  @override
  final String message = 'Email is invalid';
}

class AuthFailureLoginIsInvalid implements AuthFailure {
  @override
  final String message = 'Login is invalid';
}

class AuthFailurePasswordIsEmpty implements AuthFailure {
  @override
  final String message = 'Password is empty';
}

class AuthFailureLoginAlreadyInUse implements AuthFailure {
  @override
  final String message = 'Login already in use';
}

class AuthFailureWrongLoginPassword implements AuthFailure {
  @override
  final String message = 'Wrong login or password';
}

class AuthFailureUnexpexted implements AuthFailure {
  @override
  final String message = 'Unexpexted error';
}
