import 'package:flutter/material.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/widgets/auth_footer.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/widgets/auth_form.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/widgets/auth_route_switcher.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/widgets/auth_top_spacer.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/presentation/widgets/logo_theme_switcher.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              LogoThemeSwitcher(),
              AuthTopSpacer(),
              AuthForm(),
              AuthRouteSwitcher(),
              AuthFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
