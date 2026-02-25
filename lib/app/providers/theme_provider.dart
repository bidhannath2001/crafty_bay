import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKey = 'theme';

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get theme => _themeMode;

  List<ThemeMode> get themeModes => [
    .light, .dark, .system
  ];

  void changeTheme(ThemeMode newThemeMode){
    _themeMode = newThemeMode;
    _saveData();
    notifyListeners();
  }

  Future<void> _saveData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_themeKey, _themeMode.name);
    // print('saveLocale');
  }
  Future<void>loadData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? saveTheme = pref.getString(_themeKey);
    if(saveTheme!=null) {
      _themeMode =
          ThemeMode.values.firstWhere((mode) => mode.name == saveTheme);
    }
  }
}