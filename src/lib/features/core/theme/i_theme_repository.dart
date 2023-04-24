import 'package:flutter/material.dart';

abstract class IThemeRepository {
  ThemeData light();
  ThemeData dark();
}
