// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$dataAtom = Atom(name: 'AuthStoreBase.data', context: context);

  @override
  AuthData get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(AuthData value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$readAsyncAction =
      AsyncAction('AuthStoreBase.read', context: context);

  @override
  Future<void> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  late final _$checkAsyncAction =
      AsyncAction('AuthStoreBase.check', context: context);

  @override
  Future<void> check() {
    return _$checkAsyncAction.run(() => super.check());
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void save() {
    final _$actionInfo =
        _$AuthStoreBaseActionController.startAction(name: 'AuthStoreBase.save');
    try {
      return super.save();
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logoff() {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.logoff');
    try {
      return super.logoff();
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logon(AuthData newData) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.logon');
    try {
      return super.logon(newData);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
