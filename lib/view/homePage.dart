import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ebusticketing/view/guestUser/searchFrame.dart';
import 'package:ebusticketing/view/profile/profile.dart';
import 'adminView/adminPanel.dart';
import 'booking.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    //creation of child widget for navigating purpose
    Widget child;
    switch (_index) {
      case 0:
        child = SearchFrame();
        break;
      case 1:
        child = Booking();
        break;
      case 2:
        child = Profile();
        break;
    }

    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF07538a),
        title: GestureDetector(
          onLongPress: (){
            if(FirebaseAuth.instance.currentUser.email.toString() == "pngodup123@gmail.com")
            {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AdminPanel();
              }));
            }else{
              showDialog(context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Alert!'),
                      content: Text('Admin Not Logged In'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            }
          },
          child: Text(
              'eBusTicketing'
          ),
        ),
      ),
      body: child,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF047cb0),
      backgroundColor: Colors.white70,
      animationDuration: Duration(
        milliseconds: 200
      ),
      animationCurve: Curves.bounceOut,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white,),
        Icon(Icons.list, size: 30, color: Colors.white,),
        Icon(Icons.person, size: 30, color: Colors.white,),
      ],
      onTap: (index) {
      setState(() {
        _index = index;
      });
      },
    ),






//      BottomNavigationBar(
//        currentIndex: _index,
//        selectedItemColor: Color(0xFF047cb0),
//        unselectedItemColor: Color(0xFF047cb0),
//        onTap: (index) {
//          setState(() {
//            _index = index;
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//          icon: Icon(
//            Icons.home,
//          color: Color(0xFF047cb0),
//          ),
//          title: Text('Home'),
//        ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.list,
//              color: Color(0xFF047cb0),
//            ),
//            title: Text('Bookings'),
//
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.person,
//              color: Color(0xFF047cb0),
//            ),
//            title: Text('Profile'),
//          ),
//        ]
//      ),


    );
  }
}


