import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SeatSelection extends StatefulWidget {
  final String docMainId, docId, date, price, time, travelCompany, from, to, busType, deptTime;
  SeatSelection({this.docMainId, this.docId, this.date, this.price, this.time, this.from, this.to, this.travelCompany, this.busType, this.deptTime});
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {

  //total ticket price
  int total = 0;
  //value name in firestore
  String seatA1;
  String seatA2;
  String seatA3;
  String seatA4;
  String seatA5;
  String seatA6;

  //variable declaration to store in firestore
  String sA1;
  String sA2;
  String sA3;
  String sA4;
  String sA5;
  String sA6;



  Icon iconA1 = Icon(Icons.event_seat);
  int colorChangeA1 = 1;

  Icon iconA2 = Icon(Icons.event_seat);
  int colorChangeA2 = 1;

  Icon iconA3 = Icon(Icons.event_seat);
  int colorChangeA3 = 1;

  Icon iconA4 = Icon(Icons.event_seat);
  int colorChangeA4 = 1;

  Icon iconA5 = Icon(Icons.event_seat);
  int colorChangeA5 = 1;

  Icon iconA6 = Icon(Icons.event_seat);
  int colorChangeA6 = 1;

  @override
  void initState() {
    FirebaseFirestore.instance.collection("BusInfo").doc("${widget.docMainId}").collection("Details").
    doc("${widget.docId}").collection("Reserve").get().then((querySnapshot){
      querySnapshot.docs.forEach((element){
        print(element.id);
        String value1 = element.get("seatA1");
        String value2 = element.get("seatA2");
        String value3 = element.get("seatA3");
        String value4 = element.get("seatA4");
        String value5 = element.get("seatA5");
        //String value6 = element.get("seatA6");

        if(value1 == "A1"){
          setState(() {
            seatA1 = "A1";
            iconA1 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value2 == "A2"){
          setState(() {
            seatA2 = "A2";
            iconA2 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value3 == "A3"){
          setState(() {
            seatA3 = "A3";
            iconA3 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value4 == "A4"){
          setState(() {
            seatA4 = "A4";
            iconA4 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value5 == "A5"){
          setState(() {
            seatA5 = "A5";
            iconA5 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //conversion of value of price from string to integer
    int price = int.parse(widget.price);
    FirebaseFirestore fb = FirebaseFirestore.instance;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  SizedBox(width: 10.0,),
                  Text("${widget.to}"),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("${widget.travelCompany}"),
                ],
              ),
            ],
          ),
          backgroundColor: Color(0xFF07538a),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text("Price: $price/-"),
          SizedBox(height: 10.0,),
          Text("Total: $total/-"),
          SizedBox(height: 10.0,),
          Text("Seat: $sA1 $sA2  $sA3 $sA4 $sA5 $sA6"),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF07538a)),
              ),
              height: 250.0,
              width: 250.0,
              child: Row(
                children: <Widget>[
                  //A side Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0,),
                      //First Row
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconA1,
                            onPressed: () {
                              if(seatA1 != "A1")
                                {
                                  if (colorChangeA1 == 1) {
                                    setState(() {
                                      total = total + price;
                                      iconA1 = Icon(Icons.event_seat,
                                        color: Colors.lightBlueAccent,);
                                      colorChangeA1 = 2;
                                      sA1 = "A1";
                                    });
                                  } else {
                                    setState(() {
                                      total = total - price;
                                      iconA1 = Icon(Icons.event_seat,);
                                      colorChangeA1 = 1;
                                      sA1 = "";
                                    });
                                  }
                                }
                            },
                          ),
                          IconButton(
                            icon: iconA2,
                            onPressed: () {
                              if(seatA2 != "A2"){
                                if (colorChangeA2 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA2 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA2 = 2;
                                    sA2 = "A2";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA2 = Icon(Icons.event_seat,);
                                    colorChangeA2 = 1;
                                    sA2 = "";
                                  });
                                }
                              }

                            },
                          ),

                        ],
                      ),

                      //Second Row
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconA3,
                            onPressed: () {
                              if(sA3 != "A3"){
                                if (colorChangeA3 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA3 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA3 = 2;
                                    sA3 = "A3";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA3 = Icon(Icons.event_seat,);
                                    colorChangeA3 = 1;
                                    sA3 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconA4,
                            onPressed: () {
                              if(seatA4 != "A4"){
                                if (colorChangeA4 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA4 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA4 = 2;
                                    sA4 = "A4";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA4 = Icon(Icons.event_seat,);
                                    colorChangeA4 = 1;
                                    sA4 = "";
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      //Third Row
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconA5,
                            onPressed: () {
                              if(seatA5 != "A5"){
                                if (colorChangeA5 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA5 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA5 = 2;
                                    sA5 = "A5";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA5 = Icon(Icons.event_seat,);
                                    colorChangeA5 = 1;
                                    sA5 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconA6,
                            onPressed: () {
                              if(seatA6 != "A6"){
                                if (colorChangeA6 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA6 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA6 = 2;
                                    sA6 = "A6";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA6 = Icon(Icons.event_seat,);
                                    colorChangeA4 = 1;
                                    sA6 = "";
                                  });
                                }
                              }

                            },
                          ),

                        ],
                      ),
                      //Forth Row
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),

                        ],
                      ),

                    ],
                  ),
                  SizedBox(width: 40.0,),
                  //B side
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.person, color: Colors.white,),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {

                            },
                          ),

                        ],
                      ),
                      //First column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),

                        ],
                      ),

                      //Second column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),

                        ],
                      ),
                      //Third column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),

                        ],
                      ),
                      //Forth column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.event_seat),
                            onPressed: () {
                              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                            },
                          ),

                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              'Reserve',
            ),
            textColor: Colors.white,
            color: Color(0xFF047cb0),
            onPressed: () {
              if(sA1 != null || sA2 != null || sA3 != null || sA4 != null || sA5 != null  )
                {
                  FirebaseFirestore.instance.collection("BusInfo").doc("${widget.docMainId}")
                      .collection("Details").doc("${widget.docId}").collection("Reserve").add({
                    "date": "${widget.date}",
                    "eMail": "${FirebaseAuth.instance.currentUser.email}",
                    "total": "$total",
                    "travelCompany": "${widget.travelCompany}",
                    "departureTime": "${widget.deptTime}",
                    "seatA1": "$sA1",
                    "seatA2": "$sA2",
                    "seatA3": "$sA3",
                    "seatA4": "$sA4",
                    "seatA5": "$sA5",
                    "seatA6": "$sA6",
                  });
                  //adding in the database in bookings collection in order for respective user to view the details of bookings
                  FirebaseFirestore.instance.collection("Bookings").doc("${FirebaseAuth.instance.currentUser.email}").collection("Details").add({
                    "mainId": "${widget.docMainId}",
                    "docId": "${widget.docId}",
                    "eMail": "${FirebaseAuth.instance.currentUser.email}",
                    "date": "${widget.date}",
                    "total": "$total",
                    "travelCompany": "${widget.travelCompany}",
                    "departureTime": "${widget.deptTime}",
                    "seatA1": "$sA1",
                    "seatA2": "$sA2",
                    "seatA3": "$sA3",
                    "seatA4": "$sA4",
                    "seatA5": "$sA5",
                    "seatA6": "$sA6",
                  });

                  Navigator.of(context).pop();
                }else{
                showDialog(context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Alert!'),
                        content: Text('No Seat Selected'),
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
          ),
        ],
      ),
//      //Third column
//      Row(
//        children: <Widget>[
//          SizedBox(height: 45.0,),
//
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ), IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//
//        ],
//      ),
//      //Forth column
//      Row(
//        children: <Widget>[
//
//          IconButton(
//            icon: Icon(Icons.person),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ), IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.event_seat),
//            onPressed: () {
//              //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
//            },
//          ),
//        ],
//      ),
    );
  }


}
