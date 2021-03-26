import 'package:ebusticketing/view/sideNavigationMenu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../adminView/adminProfile.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = auth.FirebaseAuth.instance;
  auth.User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try{
      final user = _auth.currentUser;
      if(user !=null){
        this.loggedInUser = user;
        _auth.authStateChanges().listen((auth.User user) {
          this.loggedInUser = user;
          print('user= $loggedInUser');
        });
      }
    }catch(e){
     print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF047cb0)
      ),
      body: Center(
        child: loggedInUser != null ?  AdminProfile() : Text('No user logged in'),
      )
      );
  }
}

