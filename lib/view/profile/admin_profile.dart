import 'package:ebusticketing/view/admin_view/addBus/admin_add_origin_destination.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../admin_view/listBus/admin_bus_list.dart';





FirebaseAuth _auth = FirebaseAuth.instance;
class AdminProfile extends StatelessWidget {
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
                  RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xFF088ACB),
                    child: Text(
                      'Add Bus'
                    ),
                    onPressed: () {
                      if(_auth.currentUser.email == 'pngodup123@gmail.com'){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AddBusDetail();
                          },
                        ));
                      }
                    },
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xFF088ACB),
                    child: Text(
                        'Book Ticket'
                    ),
                    onPressed: () {

                    },
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xFF088ACB),
                    child: Text(
                        'Bus List'
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return AdminBusList();
                      },));
                    },
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
