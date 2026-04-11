import 'package:crafty_bay/app/providers/auth_provider.dart';
import 'package:crafty_bay/app/validators.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/shared/presentations/widgets/center_progress_indicator.dart';
import 'package:crafty_bay/features/shared/presentations/widgets/snack_bar_message.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameControler = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpProvider _signUpProvider = SignUpProvider();
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value)=>Validators.validateEmail(value),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _firstNameControler,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (value)=>Validators.validateNullOrEmpty(value, 'Enter your first name'),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (value)=>Validators.validateNullOrEmpty(value, 'Enter your last name'),

                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                      ),
                      validator: (value)=>Validators.validatePhone(value),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _cityController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'City',
                      ),
                      validator: (value)=>Validators.validateNullOrEmpty(value, 'Enter your city'),
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
                      validator: (value)=>Validators.validatePassword(value),
                    ),
                    SizedBox(height: 16,),
                    Consumer<SignUpProvider>(
                      builder: (context,_,_) {
                        if(_signUpProvider.signUpInProgress){
                          return CenterProgressIndicator();
                        }
                        return FilledButton(
                           onPressed: _onTapSignUpButton,
                          child: const Text('Sign Up'),
                        );
                      }
                    ),

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
      ),
    );
  }


  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){
        _signUp();
    }
  }
  Future<void>_signUp()async{
    final SignUpParams params = SignUpParams(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        firstName: _firstNameControler.text.trim(),
        lastName: _lastNameController.text.trim(),
        phone: _phoneController.text.trim(),
        city: _cityController.text.trim()
    );
    final bool isSuccess = await _signUpProvider.signUp(params);
    if(isSuccess){
    Navigator.pushNamed(context, VerifyOtpScreen.name);
    }else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }


  void _onTapSignInpButton(){
    context.read<AuthProvider>()..resetFields();
    Navigator.pushNamed(context, SignInScreen.name);
  }
  @override
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
