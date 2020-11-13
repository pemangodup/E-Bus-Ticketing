import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Booking extends StatelessWidget {

  auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            _auth.currentUser == null ? Text('no user signed in'): Text(
              '${_auth.currentUser.email}',
            )

          ],
        ),
      ),
    );
  }
}
