import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isPasswordHidden = true;
  String _password = '';

  void togglePasswordVisibility(){
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void updatePassword(String pass){
    _password = pass;
    notifyListeners();
  }
  void resetFields(){
    _password='';
    _isPasswordHidden = true;
    notifyListeners();
  }

  bool get isPasswordHidden=>_isPasswordHidden;
  String get password=>_password;
}