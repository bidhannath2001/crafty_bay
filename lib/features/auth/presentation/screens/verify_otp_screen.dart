import 'dart:async';

import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

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

  void _onTapSignInButton() {}

  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  Timer? _timer;
  int _start = 30;
  bool _shorResendOtpButton = false;

  @override
  void initState() {
    _startTimer();
    // TODO: implement initState
    super.initState();
  }

  void _startTimer(){
    _start =  30;
    _shorResendOtpButton = false;
    setState(() {

    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      if(_start == 0){
        timer.cancel();
        _shorResendOtpButton = true;
      }
      else{
        _start--;

      }
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(!_shorResendOtpButton)
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black38),
            children: [
              TextSpan(text: 'You can sent OTP after '),
              TextSpan(
                text: '${_start}s',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if(_shorResendOtpButton)  TextButton(onPressed: _resendOtpButton, child: Text('ReSend OTP')),
      ],
    );
  }
  void _resendOtpButton(){
_startTimer();
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
