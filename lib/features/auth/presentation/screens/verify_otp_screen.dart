import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';
import '../widgets/resend_otp.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});
  static const String name = '/verify-otp';
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpController = PinInputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  AppLogo(width: 100, height: 100),
                  SizedBox(height: 16),
                  Text('Enter OTP Code', style: context.textTheme.titleLarge),
                  Text(
                    'A 4 Digit OTP code has benn sent to your email address',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 24),
                  MaterialPinField(
                    length: 4,
                    pinController: _otpController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.outlined,
                      fillColor: Colors.transparent,
                      completeFillColor: AppColors.themeColor,
                      borderColor: AppColors.themeColor,
                      cellSize: Size(56, 64),
                      spacing: 16,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Verify'),
                  ),
                  const SizedBox(height: 16),
                  ResendOtp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}

