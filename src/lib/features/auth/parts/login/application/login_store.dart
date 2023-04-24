import 'package:mobx/mobx.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';
import 'package:mobx_auth_animation/features/auth/model/i_auth_repository.dart';
import 'package:mobx_auth_animation/features/auth/model/validators.dart';
import 'package:mobx_auth_animation/features/auth/parts/global/application/auth_store.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final IAuthRepository _repository;
  final AuthStore _authStore;

  LoginStoreBase(this._repository, this._authStore);

  @observable
  String login = '';

  @observable
  String password = '';

  @computed
  String? get loginFailure => checkLogin(login);

  @computed
  String? get passwordFailure => checkPassword(password);

  @action
  setLogin(String value) {
    login = value;
  }

  @action
  setPassword(String value) {
    password = value;
  }

  @action
  Future<void> submit() async {
    AuthData data = await _repository.login(login, password);
    _authStore.logon(data);
  }
}
