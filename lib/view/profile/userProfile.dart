import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/adminProfile.dart';
import 'package:ebusticketing/view/profile/profileDetailTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class UserProfile extends StatefulWidget {

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File _profileImage;
  final picker = ImagePicker();


  @override
  void initState() {
    FirebaseFirestore.instance.collection("User").get().then((value){
      value.docs.forEach((element) {
        setState(() {
          _firstName = element.get("firstName");
          _lastName = element.get("lastName");
        });
      });
    });
    super.initState();
  }
  String _firstName, _lastName;

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser.email == 'pngodup123@gmail.com'? AdminProfile(): Container(
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
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Press"),
                    onPressed: () {
                      getImage(ImageSource.camera);
                      },
                  )
                ],
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
                  height: 10.0,
                ),
                Text(
                    "${FirebaseAuth.instance.currentUser.email}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height:5.0),
                Text(
                  "$_firstName $_lastName",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void getImage(ImageSource gallery) async {
    PickedFile imageFile = await picker.getImage(source: gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
//    final appDir = await getApplicationDocumentsDirectory();
//    final fileName = basename(imageFile.path);
//    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
    setState(() {
      _profileImage = tmpFile;
    });
  }
}
