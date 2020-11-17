import 'package:ebusticketing/view/profile_page.dart';
import 'package:ebusticketing/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:ebusticketing/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'profilePage': (context) => Profile(),
        'signUp': (context) => SignUp(),
      },
    );
  }
}

