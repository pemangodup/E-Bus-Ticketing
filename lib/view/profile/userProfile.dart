import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              color: Colors.lightGreen,
            ),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF047cb0),
              ),
            ),
          ),
          Positioned(
            top: 180.0,
            child: Container(
              width: 415.0,
              height: 550.0,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
            ),
          ),

          Positioned(
            top: 10.0,
            left: 85.0,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                  ),
                  radius: 50.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                    "${FirebaseAuth.instance.currentUser.email}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
