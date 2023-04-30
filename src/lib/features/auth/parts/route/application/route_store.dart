import 'package:mobx/mobx.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_route.dart';
part 'route_store.g.dart';

class AuthRouteStore = AuthRouteStoreBase with _$AuthRouteStore;

abstract class AuthRouteStoreBase with Store {
  @observable
  AuthRoute route = AuthRoute.login;

  @observable
  bool complite = true;

  @action
  void swich(AuthRoute newRoute) {
    if (newRoute == route) return;
    route = newRoute;
    if (complite = true) {
      complite = false;
    }
  }

  @action
  void finish() {
    complite = true;
  }
}
