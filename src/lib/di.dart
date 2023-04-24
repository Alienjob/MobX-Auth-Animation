import 'package:get_it/get_it.dart';
import 'package:mobx_auth_animation/features/auth/infrastructure/auth_repository.dart';
import 'package:mobx_auth_animation/features/auth/model/i_auth_repository.dart';
import 'package:mobx_auth_animation/features/auth/parts/global/application/auth_store.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/application/route_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependency() async {
  var _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(_prefs);

  getIt.registerSingleton<IAuthRepository>(AuthRepository(_prefs));
  getIt.registerSingleton<AuthStore>(AuthStore(getIt()));
  getIt.registerFactory<AuthRouteStore>(() => AuthRouteStore());
}
