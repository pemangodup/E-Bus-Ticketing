import 'package:ebusticketing/view/login.dart';
import 'package:ebusticketing/view/signUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';




class LoginSignup extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<LoginSignup> {
  String firstName, lastName, email, password, retypePassword;


  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                elevation: 10,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
                color: Colors.white70,
                child: Text(
                  'Login',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.lightGreen,
              ),
              SizedBox(width: 10.0,),
              RaisedButton(
                elevation: 10,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                },
                color: Colors.white70,
                child: Text(
                  'Signup User',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

}


