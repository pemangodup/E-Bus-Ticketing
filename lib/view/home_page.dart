import 'package:flutter/material.dart';
import 'package:ebusticketing/view/search_frame.dart';
import 'package:ebusticketing/view/booking_list.dart';
import 'package:ebusticketing/view/profile_page.dart';


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
        backgroundColor: Color(0xFF07538a),
        title: Text(
            'eBusTicketing'
        ),
        actions: <Widget>[
          Icon(
            Icons.business,
            color: Colors.white,
          ),
        ],
      ),
      body: child,
      //SizedBox.expand(child: child)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Color(0xFF047cb0),
        unselectedItemColor: Color(0xFF047cb0),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          color: Color(0xFF047cb0),
          ),
          title: Text('Home'),
        ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Color(0xFF047cb0),
            ),
            title: Text('Bookings'),

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xFF047cb0),
            ),
            title: Text('Profile'),
          ),
        ]
      ),
    );
  }
}


