import 'package:ebusticketing/view/adminView/adminProfile.dart';
import 'package:flutter/material.dart';
import 'package:ebusticketing/view/sideNavigationMenu.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;


class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
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
            title: Text('Admin Profile'),
            backgroundColor: Color(0xFF047cb0)
        ),
        body: Center(
          child: auth.FirebaseAuth.instance.currentUser.email.toString() == "pngodup123@gmail.com" ?  AdminProfile() : Text('No user logged in'),
        )
    );
  }
}















