import 'package:ebusticketing/view/add_bus_detail.dart';
import 'package:ebusticketing/view/login.dart';
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




//app bar widget
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
              color: Colors.green,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Bus'),
            onTap: () {
              if(_auth.currentUser != null){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AddBusDetail(),
                ));
              }else{
                print('Already logged in............');
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
