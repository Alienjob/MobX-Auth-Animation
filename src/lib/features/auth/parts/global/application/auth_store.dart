import 'package:mobx/mobx.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';
import 'package:mobx_auth_animation/features/auth/model/i_auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  AuthData data = AuthData.emty();

  final IAuthRepository _repository;

  AuthStoreBase(this._repository);

  @action
  Future<void> read() async {
    data = await _repository.read();
  }

  @action
  void save() {
    _repository.save(data);
  }

  @action
  Future<void> check() async {
    data = AuthData(
      isAuthorized: await _repository.check(data.login, data.token),
      login: data.login,
      email: data.email,
      token: data.token,
    );
  }

  @action
  void logoff() {
    _repository.logoff();
    data = AuthData.emty();
  }

  @action
  void logon(AuthData newData) {
    data = newData;
    _repository.save(data);
  }
}
