import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: Colors.amber,
      appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 122, 19, 19),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)));

  static final _darkTheme = ThemeData(brightness: Brightness.dark, colorSchemeSeed: Colors.amber.withOpacity(.6));

  // Cargar la preferencia de tema del almacenamiento
  Future<void> loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? _darkTheme : _lightTheme);
  }

  // Cambiar y guardar la preferencia de tema
  void toggleTheme(bool isDarkMode) {
    emit(isDarkMode ? _darkTheme : _lightTheme);
    _saveThemePreference(isDarkMode);
  }

  // Guardar la preferencia de tema en almacenamiento local
  static Future<void> _saveThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }
}
