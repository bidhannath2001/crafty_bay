
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/'; //magic string
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigateToSignUpScreen();
    super.initState();
  }

  Future<void> _navigateToSignUpScreen()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: AppLogo()),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

