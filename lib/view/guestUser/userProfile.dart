import 'package:ebusticketing/view/adminView/addBus/admin_add_origin_destination.dart';
import 'package:ebusticketing/view/adminView/listBus/adminBusList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';







FirebaseAuth _auth = FirebaseAuth.instance;
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${_auth.currentUser.email.toString()}")],
            ),
          ],
        ),
      ),
    );;
  }
}
