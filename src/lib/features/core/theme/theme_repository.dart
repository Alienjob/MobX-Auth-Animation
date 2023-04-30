import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:mobx_auth_animation/features/core/theme/i_theme_repository.dart';

class ThemeRepository implements IThemeRepository {
  @override
  ThemeData dark() {
    return ThemeData.dark().copyWith();
  }

  @override
  ThemeData light() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        background: Color(0xFFF9F9F9),
        primary: Color(0xFF4A55A7),
        secondary: Color(0xFFBFDBFE),
        primaryContainer: Color(0xFF1A5CFF),
      ),
    );
  }
}
