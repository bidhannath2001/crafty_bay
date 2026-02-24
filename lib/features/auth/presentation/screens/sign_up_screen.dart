import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentations/widgets/language_switcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Column(
        children: [
          LanguageSwitcher(),
        ],
      ),
    );
  }
}


