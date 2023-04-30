// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthRouteStore on AuthRouteStoreBase, Store {
  late final _$routeAtom =
      Atom(name: 'AuthRouteStoreBase.route', context: context);

  @override
  AuthRoute get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(AuthRoute value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$compliteAtom =
      Atom(name: 'AuthRouteStoreBase.complite', context: context);

  @override
  bool get complite {
    _$compliteAtom.reportRead();
    return super.complite;
  }

  @override
  set complite(bool value) {
    _$compliteAtom.reportWrite(value, super.complite, () {
      super.complite = value;
    });
  }

  late final _$AuthRouteStoreBaseActionController =
      ActionController(name: 'AuthRouteStoreBase', context: context);

  @override
  void swich(AuthRoute newRoute) {
    final _$actionInfo = _$AuthRouteStoreBaseActionController.startAction(
        name: 'AuthRouteStoreBase.swich');
    try {
      return super.swich(newRoute);
    } finally {
      _$AuthRouteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finish() {
    final _$actionInfo = _$AuthRouteStoreBaseActionController.startAction(
        name: 'AuthRouteStoreBase.finish');
    try {
      return super.finish();
    } finally {
      _$AuthRouteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
route: ${route},
complite: ${complite}
    ''';
  }
}
