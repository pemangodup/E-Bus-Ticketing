import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),

              RaisedButton(
                elevation: 10,
                onPressed: () async{
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'home', (route) => false);
                  }catch(e){
                    print(e);
                  }
                },
                color: Colors.white70,
                child: Text(
                  'Sign Up',
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
