import 'package:ebusticketing/view/admin_view/add_bus_detail.dart';
import 'package:ebusticketing/view/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth _auth = FirebaseAuth.instance;
//app bar widget
// ignore: must_be_immutable
class NavDrawer extends StatelessWidget {
  var _user = _auth.currentUser;
  @override
  Widget build(BuildContext context) {
    Future<void> loggedOut() async{
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
  }
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              _auth.currentUser != null? Text('${_user.email}'):Text('No User Signed In'),
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF047cb0),
//              image: DecorationImage(
//                  fit: BoxFit.fill,
//                  image: AssetImage('assets/images/cover.jpg'),
//              )
          ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Sign Up'),
            onTap: () {
              if(_auth.currentUser==null){
                Navigator.pushNamed(context, 'signUp');
              }else{
                return null;
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Login'),
            onTap: () {
              if(_auth.currentUser == null){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }else{
                print('Already logged in............');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              if(_auth.currentUser !=null){
                return loggedOut();
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
