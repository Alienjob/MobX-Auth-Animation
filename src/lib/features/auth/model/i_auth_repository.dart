import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';
import 'package:mobx_auth_animation/features/auth/model/register_data.dart';

abstract class IAuthRepository {
  Future<AuthData> read();
  Future<void> save(AuthData data);
  Future<AuthData> login(String login, String password);
  Future<AuthData> signup(RegisterData data);
  Future<void> logoff();

  Future<bool> check(String login, String token);

  Future<void> clearStorage();
}
