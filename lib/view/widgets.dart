import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth _auth = FirebaseAuth.instance;
//layout if user is not logged in in profile page.....
Widget userNotLoggedinProfilePage(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('${_auth.currentUser.email}'),
          Expanded(
            child: RaisedButton(
              onPressed: () {
                print('login');
              },
              color: Colors.white70,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              elevation: 10,
            ),
          ),
          SizedBox(width: 5.0,),
          Expanded(
            child: RaisedButton(
              onPressed: (){
                print('Sign Up');
              },
              color: Colors.white70,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              elevation: 10,
            ),
          ),
        ],
      ),
    ),
  );
}