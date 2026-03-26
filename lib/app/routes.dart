import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/product/presentation/screens/product_details_screen.dart';
import '../features/product/presentation/screens/product_list_screen.dart';
import '../features/shared/presentations/screens/main_nav_holder_screen.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    Widget widget = SizedBox();
    switch(settings.name){
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
      case SignInScreen.name:
        widget = SignInScreen();
      case VerifyOtpScreen.name:
        widget = VerifyOtpScreen();
      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
      case ProductListScreen.name:
        widget = ProductListScreen(categoryName: settings.arguments as String);
      case ProductDetailsScreen.name:
        widget = ProductDetailsScreen();
    }
    return MaterialPageRoute(builder: (context)=>widget);
  }
}