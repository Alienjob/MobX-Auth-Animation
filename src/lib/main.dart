import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_auth_animation/di.dart';
import 'package:mobx_auth_animation/features/auth/parts/global/application/auth_store.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/application/route_store.dart';
import 'package:mobx_auth_animation/features/core/theme/i_theme_repository.dart';
import 'package:mobx_auth_animation/features/core/theme/theme_repository.dart';
import 'package:mobx_auth_animation/features/core/theme/theme_store.dart';
import 'package:provider/provider.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/auth_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (BuildContext context) => ThemeStore(),
      ),
      Provider(
        create: (BuildContext context) => GetIt.instance<AuthStore>(),
      )
    ],
    child: MyApp(themeRepository: ThemeRepository()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeRepository});
  final IThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    ThemeStore themeStore = Provider.of<ThemeStore>(context);
    return Observer(
      builder: (BuildContext context) {
        return MaterialApp(
          theme: themeRepository.light(),
          darkTheme: themeRepository.dark(),
          themeMode: themeStore.themeMode,
          home: Provider(
            create: (_) => GetIt.instance<AuthRouteStore>(),
            child: const AuthPage(),
          ),
        );
      },
    );
  }
}
