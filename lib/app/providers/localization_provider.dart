import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  final String _localKey = 'locale';
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  List <Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void changeLocale(Locale newLocale){
    _locale = newLocale;
    _saveData();
    // print('Locale Changed');
    notifyListeners();
  }

  Future<void> _saveData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_localKey, _locale.languageCode);
    // print('saveLocale');
  }
  Future<void>loadData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savelocale = pref.getString(_localKey);
    if(savelocale!=null){
      _locale = Locale(savelocale);
    }
    
  }

}