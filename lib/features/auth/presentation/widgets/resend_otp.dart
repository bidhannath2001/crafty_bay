import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
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
    super.dispose();
  }
}
