import 'package:ebusticketing/view/adminView/addBus/admin_add_origin_destination.dart';
import 'package:ebusticketing/view/adminView/listBus/adminBusList.dart';
import 'package:ebusticketing/view/adminView/updateTicket/updateUserTicket.dart';
import 'package:ebusticketing/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



FirebaseAuth _auth = FirebaseAuth.instance;
class AdminProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe7e7e7),
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
              height: 220,
              decoration: BoxDecoration(
                color: Color(0xFF047cb0),
              ),
              child: Center(
                child: Text("${FirebaseAuth.instance.currentUser.email}"),
              ),
            ),
          ),
          Positioned(
            top: 180.0,
            child: Container(
              width: 415.0,
              height: 600.0,
              decoration: BoxDecoration(
                  color: Colors.white,
//                  Color(0xFFe0e0eb),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )

              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 50.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 100.0,
                                width: 150.0,
                                child: RaisedButton(
                                  textColor: Colors.lightBlueAccent,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0,),
                                      Icon(Icons.add_box),
                                      Text(
                                          'Add Bus'
                                      ),
                                    ],
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
                              ),
                              SizedBox(
                                height: 100.0,
                                width: 150.0,
                                child: RaisedButton(
                                  textColor: Colors.lightBlueAccent,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0,),
                                      Icon(Icons.book),
                                      Text(
                                          'Book Ticket'
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return HomePage();
                                    }));
                                  },
                                ),
                              ),

                            ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 150.0,
                              height: 100.0,
                              child: RaisedButton(
                                textColor: Colors.lightBlueAccent,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20.0,),
                                    Icon(Icons.delete),
                                    Text(
                                        'Delete Ticket'
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if(_auth.currentUser.email == 'pngodup123@gmail.com'){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return UpdateUserProfile();
                                      },
                                    ));
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 150.0,
                              height: 100.0,
                              child: RaisedButton(
                                textColor: Colors.lightBlueAccent,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20.0,),
                                    Icon(Icons.update),
                                    Text(
                                        'Update'
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return AdminBusList();
                                  },));
                                },
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
