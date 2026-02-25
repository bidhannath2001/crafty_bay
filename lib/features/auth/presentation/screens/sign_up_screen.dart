import 'package:crafty_bay/app/providers/auth_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';



  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisibility = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameControler = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
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
                  Text('Create Your Account', style: context.textTheme.titleLarge),
                  Text('Get stated with your details', style: context.textTheme.bodyLarge?.copyWith(
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
                  TextFormField(
                    controller: _firstNameControler,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _cityController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: authProvider.isPasswordHidden,
                    obscuringCharacter: '*',
                    textInputAction: TextInputAction.done,
                    onChanged: authProvider.updatePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: authProvider.password.isNotEmpty? IconButton(onPressed: authProvider.togglePasswordVisibility,
                          icon: Icon(authProvider.isPasswordHidden? Icons.visibility :Icons.visibility_off)) : null,
                    ),
                  ),
                  SizedBox(height: 16,),
                  FilledButton(
                      onPressed: _onTapSignUpButton, child: Text('Sign Up')),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: _onTapSignInpButton,
                        child: const Text('Sign In'),
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


  void _onTapSignUpButton(){}
  void _onTapSignInpButton(){
    context.read<AuthProvider>()..resetFields();
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void dispose(){
    _emailController.dispose();
    _firstNameControler.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
