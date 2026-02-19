import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:crafty_bay/l10n/app_localizations_bn.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  List <Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void changeLocale(Locale newLocale){
    _locale = newLocale;
    notifyListeners();
  }

}