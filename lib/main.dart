import 'package:crafty_bay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'crafty_bay_app.dart';

//fvm set up
//firebase set up
//Crashlytics set up
//Analytics set up
//Localization set up
//provider set up
//Architecture set up
//Theming set up

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CraftyBayApp());
}
