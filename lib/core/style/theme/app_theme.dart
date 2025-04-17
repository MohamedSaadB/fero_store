import 'package:feroo_store/core/serves/shared_pref/pref_key.dart';
import 'package:feroo_store/core/serves/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'theme_dark_light.dart';

class AppThemes {
  static Map<ThemeMode, ThemeData> getThemes(Locale locale) {
    return {
      ThemeMode.light: themeLight(locale),
      ThemeMode.dark: themeDark(locale),
    };
  }
}
