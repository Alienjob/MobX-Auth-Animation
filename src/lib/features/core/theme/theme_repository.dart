import 'package:flutter/src/material/theme_data.dart';
import 'package:mobx_auth_animation/features/core/theme/i_theme_repository.dart';

class ThemeRepository implements IThemeRepository {
  @override
  ThemeData dark() {
    return ThemeData.dark().copyWith();
  }

  @override
  ThemeData light() {
    return ThemeData.light().copyWith();
  }
}
