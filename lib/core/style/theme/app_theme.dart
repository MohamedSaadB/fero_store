import 'package:flutter/material.dart';
import 'theme_dark_light.dart';

class AppThemes {
  static final themes = {
    ThemeMode.light: themeLight(),
    ThemeMode.dark: themeDark(),
  };
}
