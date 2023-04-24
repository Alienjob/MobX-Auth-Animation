// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on SignupStoreBase, Store {
  Computed<String?>? _$emailFailureComputed;

  @override
  String? get emailFailure =>
      (_$emailFailureComputed ??= Computed<String?>(() => super.emailFailure,
              name: 'SignupStoreBase.emailFailure'))
          .value;
  Computed<String?>? _$loginFailureComputed;

  @override
  String? get loginFailure =>
      (_$loginFailureComputed ??= Computed<String?>(() => super.loginFailure,
              name: 'SignupStoreBase.loginFailure'))
          .value;
  Computed<String?>? _$passwordFailureComputed;

  @override
  String? get passwordFailure => (_$passwordFailureComputed ??=
          Computed<String?>(() => super.passwordFailure,
              name: 'SignupStoreBase.passwordFailure'))
      .value;

  late final _$emailAtom =
      Atom(name: 'SignupStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$loginAtom =
      Atom(name: 'SignupStoreBase.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignupStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$submitAsyncAction =
      AsyncAction('SignupStoreBase.submit', context: context);

  @override
  Future<void> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  late final _$SignupStoreBaseActionController =
      ActionController(name: 'SignupStoreBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLogin(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
login: ${login},
password: ${password},
emailFailure: ${emailFailure},
loginFailure: ${loginFailure},
passwordFailure: ${passwordFailure}
    ''';
  }
}
