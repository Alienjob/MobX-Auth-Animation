import 'package:mobx/mobx.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';
import 'package:mobx_auth_animation/features/auth/model/register_data.dart';
import 'package:mobx_auth_animation/features/auth/model/i_auth_repository.dart';
import 'package:mobx_auth_animation/features/auth/model/validators.dart';
import 'package:mobx_auth_animation/features/auth/parts/global/application/auth_store.dart';

part 'signup_store.g.dart';

class SignupStore = SignupStoreBase with _$SignupStore;

abstract class SignupStoreBase with Store {
  final IAuthRepository _repository;
  final AuthStore _authStore;

  SignupStoreBase(this._repository, this._authStore);

  @observable
  String email = '';

  @observable
  String login = '';

  @observable
  String password = '';

  @computed
  String? get emailFailure => checkEmail(email);

  @computed
  String? get loginFailure => checkLogin(login);

  @computed
  String? get passwordFailure => checkPassword(password);

  @action
  setEmail(String value) {
    email = value;
  }

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
    AuthData data = await _repository.signup(RegisterData(
      login: login,
      email: email,
      password: password,
    ));
  }
}
