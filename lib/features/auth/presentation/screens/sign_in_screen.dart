import 'package:crafty_bay/app/providers/auth_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authProvider = context.watch<AuthProvider>()..resetFields();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              // key: ,
              child: Column(
                children: [
                  // LanguageSwitcher(),
                  // ThemeSwitcher(),
                  SizedBox(height: 70,),
                  AppLogo(width: 100, height: 100),
                  SizedBox(height: 16,),
                  Text('Sign In Your Account', style: context.textTheme.titleLarge),
                  Text('Sign in with your account details', style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  )),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 8,),
                  Consumer<AuthProvider>(
                    builder: (context,authProvider,_) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: authProvider.isPasswordHidden,
                        obscuringCharacter: '*',
                        textInputAction: TextInputAction.done,
                        onChanged: authProvider.updatePassword,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: _passwordController.text.isNotEmpty? IconButton(onPressed: authProvider.togglePasswordVisibility,
                             icon: Icon(authProvider.isPasswordHidden? Icons.visibility :Icons.visibility_off)) : null,
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 16,),
                  FilledButton(
                      onPressed: _onTapSignInButton, child: Text('Sign IN')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: _onTapSignUpButton,
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton(){
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }
  void _onTapSignUpButton(){
    context.read<AuthProvider>()..resetFields();
    Navigator.pushNamed(context, SignUpScreen.name);
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
