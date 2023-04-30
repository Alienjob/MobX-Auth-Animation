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
    return const AuthFormAnimator(login: LoginForm(), signup: SignupForm());
  }
}

class AuthFormAnimator extends StatefulWidget {
  const AuthFormAnimator({
    super.key,
    required this.login,
    required this.signup,
  });

  final Widget login;
  final Widget signup;

  @override
  State<AuthFormAnimator> createState() => _AuthFormAnimatorState();
}

class _AuthFormAnimatorState extends State<AuthFormAnimator>
    with SingleTickerProviderStateMixin {
  late AuthRouteStore _store;
  late Animation<double> switchFormAnimation;
  late AnimationController switchFormAnimationController;

  @override
  initState() {
    super.initState();
    switchFormAnimationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() {
    switchFormAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<AuthRouteStore>(context);
    switchFormAnimation = CurvedAnimation(
      parent: switchFormAnimationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    )..addStatusListener((status) {
        if ((status == AnimationStatus.completed) ||
            (status == AnimationStatus.dismissed)) {
          _store.finish();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_store.complite) {
        return (_store.route == AuthRoute.login) ? widget.login : widget.signup;
      } else {
        (_store.route == AuthRoute.signup)
            ? switchFormAnimationController.forward()
            : switchFormAnimationController.reverse();
        return Stack(
          children: [
            SlideAnimator(
              switchFormAnimation: switchFormAnimation,
              begin: 0,
              end: -1,
              child: widget.login,
            ),
            SlideAnimator(
              switchFormAnimation: switchFormAnimation,
              begin: 1,
              end: 0,
              child: widget.signup,
            ),
          ],
        );
      }
    });
  }
}

class SlideAnimator extends StatelessWidget {
  const SlideAnimator({
    super.key,
    required this.switchFormAnimation,
    required this.child,
    required this.begin,
    required this.end,
  });

  final Animation<double> switchFormAnimation;
  final Widget child;
  final double begin;
  final double end;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: switchFormAnimation,
        builder: (context, child) {
          return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(begin, 0),
                end: Offset(end, 0),
              ).animate(
                CurvedAnimation(
                  parent: switchFormAnimation,
                  curve: Curves.ease,
                ),
              ),
              child: child);
        },
        child: child);
  }
}
