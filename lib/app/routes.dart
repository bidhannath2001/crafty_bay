import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';

class Routes {
  static Route<dynamic>? OngenerateRoute(RouteSettings settings){
    Widget widget = SizedBox();
    switch(settings.name){
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
    }
    return MaterialPageRoute(builder: (context)=>widget);
  }
}