import 'package:ebusticketing/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;


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
    return Container(
      color: Colors.white,
      child: Container(
        child: loggedInUser == null ? SignUp(): Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: Text('${loggedInUser.email}')),
              RaisedButton(
                onPressed: () {
                  loggedOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }




  Future<void> loggedOut() async{
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
  }


}

