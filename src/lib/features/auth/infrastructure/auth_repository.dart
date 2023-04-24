import 'dart:convert';

import 'package:mobx_auth_animation/features/auth/infrastructure/auth_data_dto.dart';
import 'package:mobx_auth_animation/features/auth/infrastructure/register_data_dto.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_failure.dart';
import 'package:mobx_auth_animation/features/auth/model/i_auth_repository.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';
import 'package:mobx_auth_animation/features/auth/model/register_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static const String logins = 'logins';
  static const String current = 'current';
  static String userKey(String login) {
    return 'User$login';
  }
}

class AuthRepository implements IAuthRepository {
  final SharedPreferences _prefs;

  AuthRepository(this._prefs);

  @override
  Future<bool> check(String login, String token) async {
    return _tokenExpireDate(token).isAfter(DateTime.now());
  }

  @override
  Future<AuthData> read() async {
    String? current = _prefs.getString(_Keys.current);
    if (current == null) return AuthData.emty();
    return AuthDataDTO.fromJson(current).toModel();
  }

  @override
  Future<void> save(AuthData data) async {
    await _prefs.setString(_Keys.current, AuthDataDTO.fromModel(data).toJson());
  }

  @override
  Future<AuthData> login(String login, String password) async {
    var logins = _prefs.getStringList(_Keys.logins);

    if ((logins == null) || (!logins.contains(login))) {
      throw AuthFailureWrongLoginPassword();
    }

    var regDataString = _prefs.getString(_Keys.userKey(login));
    if (regDataString == null) throw AuthFailureUnexpexted();
    var regData = RegisterDataDTO.fromJson(regDataString).toModel();
    if (password != regData.password) throw AuthFailureUnexpexted();

    var token = _generateToken(login, password);

    return AuthData(
        isAuthorized: true, login: login, email: regData.email, token: token);
  }

  @override
  Future<AuthData> signup(RegisterData data) async {
    var logins = _prefs.getStringList(_Keys.logins);

    if ((logins != null) && (logins.contains(data.login))) {
      throw AuthFailureLoginAlreadyInUse();
    }

    logins ??= [];
    logins.add(data.login);
    await _prefs.setStringList(_Keys.logins, logins);

    await _prefs.setString(
        _Keys.userKey(data.login), RegisterDataDTO.fromModel(data).toJson());

    return await login(data.login, data.password);
  }

  @override
  Future<void> clearStorage() async {
    var logins = _prefs.getStringList(_Keys.logins);
    for (var login in logins ?? []) {
      await _prefs.remove(_Keys.userKey(login));
    }
    await _prefs.remove(_Keys.logins);
    await _prefs.remove(_Keys.current);
  }

  String _generateToken(String login, String password) {
    return jsonEncode({
      'login': login,
      'password': password,
      'expire': DateTime.now(),
    });
  }

  DateTime _tokenExpireDate(String token) {
    return DateTime.parse(jsonDecode(token)['expire']);
  }

  @override
  Future<void> logoff() async {
    _prefs.remove(_Keys.current);
  }
}
