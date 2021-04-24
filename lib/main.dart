import 'package:ebusticketing/view/profile/profile.dart';
import 'package:ebusticketing/view/signUp.dart';
import 'package:ebusticketing/view/profile/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:ebusticketing/view/homePage.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'userProfile': (context) => UserProfile(),
        'profilePage': (context) => Profile(),
        'signUp': (context) => SignUp(),
      },
    );
  }
}

