import 'package:crafty_bay/app/providers/auth_provider.dart';
import 'package:crafty_bay/app/providers/localization_provider.dart';
import 'package:crafty_bay/app/providers/theme_provider.dart';
import 'package:crafty_bay/features/shared/presentations/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LocalizationProvider()..loadData()),
        ChangeNotifierProvider(create: (_)=>ThemeProvider()..loadData()),
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
        ChangeNotifierProvider(create: (_)=>MainNavProvider()),
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context,localizationProvider,child) {
          return Consumer<ThemeProvider>(
            builder: (context,themeProvider,child) {
              return MaterialApp(
                title: 'Crafty Bay',
                initialRoute: SplashScreen.name,
                onGenerateRoute: Routes.OngenerateRoute,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.theme,

                localizationsDelegates: [
                  AppLocalizations.delegate, // Add this line
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: localizationProvider.supportedLocales,
                locale: localizationProvider.locale,
                // home: SplashScreen(),
              );
            }
          );
        }
      ),
    );
  }
}
