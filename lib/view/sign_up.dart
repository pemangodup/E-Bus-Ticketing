import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String firstName, lastName, email, password, retypePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
                TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                 firstName = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    lastName = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
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
              SizedBox(height: 10.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Retype Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    retypePassword = value;
                },
              ),
              RaisedButton(
                elevation: 10,
                onPressed: () {
                  print(lastName);
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




