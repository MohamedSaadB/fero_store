import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _themeKey = 'app_theme_mode';

  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system)){
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_themeKey);

    ThemeMode mode = ThemeMode.system;

    if (saved == 'light') mode = ThemeMode.light;
    else if (saved == 'dark') mode = ThemeMode.dark;

    emit(ThemeState(themeMode: mode));
  }

  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    String value = mode.name;
    print("-----------${state.themeMode}");

    await prefs.setString(_themeKey, value);

    emit(ThemeState(themeMode: mode));
  }

  void toggleTheme() {
    final isDark = state.themeMode == ThemeMode.dark;
    print("-----------$isDark");
    setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  ThemeMode get currentMode => state.themeMode;
}
