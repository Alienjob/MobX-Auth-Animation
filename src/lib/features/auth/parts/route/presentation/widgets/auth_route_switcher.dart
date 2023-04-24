import 'package:flutter/material.dart';
import 'package:mobx_auth_animation/features/auth/model/auth_route.dart';
import 'package:mobx_auth_animation/features/auth/parts/route/application/route_store.dart';
import 'package:provider/provider.dart';

class AuthRouteSwitcher extends StatelessWidget {
  const AuthRouteSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              var store = Provider.of<AuthRouteStore>(context, listen: false);
              store.swich(AuthRoute.login);
            },
            child: Text('Login')),
        ElevatedButton(
            onPressed: () {
              var store = Provider.of<AuthRouteStore>(context, listen: false);
              store.swich(AuthRoute.signup);
            },
            child: Text('Sign-up')),
      ],
    );
  }
}
