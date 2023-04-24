import 'package:flutter/material.dart';
import 'package:mobx_auth_animation/features/core/theme/theme_store.dart';
import 'package:provider/provider.dart';

class LogoThemeSwitcher extends StatelessWidget {
  const LogoThemeSwitcher({
    super.key,
  });

  void tapHandler(BuildContext context) {
    Provider.of<ThemeStore>(context, listen: false).switchTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 55, 0, 0),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            GestureDetector(
                onTap: () => tapHandler(context),
                child: Image.asset('assets/images/logo.png')),
          ],
        ),
      ),
    );
  }
}
