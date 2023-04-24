import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_route.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/application/route_store.dart';
import 'package:mobx_auth_animation/features/auth/parts/login/presentation/login_form.dart';
import 'package:mobx_auth_animation/features/auth/parts/signup/presentation/signup_form.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthRouteStore store = Provider.of<AuthRouteStore>(context, listen: true);
    return Observer(
        builder: (context) => (store.route == AuthRoute.login)
            ? const LoginForm()
            : const SignupForm());
  }
}
