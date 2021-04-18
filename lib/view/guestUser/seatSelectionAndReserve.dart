import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';



class SeatSelection extends StatefulWidget {
  final String docMainId, docId, date, price, time, travelCompany, from, to, busType, deptTime;
  SeatSelection({this.docMainId, this.docId, this.date, this.price, this.time, this.from, this.to, this.travelCompany, this.busType, this.deptTime});
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {

  //total ticket price
  int total = 0;
  //value name in firestore in A side
  String seatA1;
  String seatA2;
  String seatA3;
  String seatA4;
  String seatA5;
  String seatA6;
  String seatA7;
  String seatA8;
  String seatA9;
  String seatA10;

  //value name in firestore in B side
  String seatB1;
  String seatB2;
  String seatB3;
  String seatB4;
  String seatB5;
  String seatB6;
  String seatB7;
  String seatB8;
  String seatB9;
  String seatB10;


  //variable declaration to store in firestore in A side
  String sA1;
  String sA2;
  String sA3;
  String sA4;
  String sA5;
  String sA6;
  String sA7;
  String sA8;
  String sA9;
  String sA10;

  //variable declaration to store in firestore in B side
  String sB1;
  String sB2;
  String sB3;
  String sB4;
  String sB5;
  String sB6;
  String sB7;
  String sB8;
  String sB9;
  String sB10;

  var listSeats = new List();

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

  Icon iconA7 = Icon(Icons.event_seat);
  int colorChangeA7 = 1;

  Icon iconA8 = Icon(Icons.event_seat);
  int colorChangeA8 = 1;

  Icon iconA9 = Icon(Icons.event_seat);
  int colorChangeA9 = 1;

  Icon iconA10 = Icon(Icons.event_seat);
  int colorChangeA10 = 1;

  Icon iconB1 = Icon(Icons.event_seat);
  int colorChangeB1 = 1;

  Icon iconB2 = Icon(Icons.event_seat);
  int colorChangeB2 = 1;

  Icon iconB3 = Icon(Icons.event_seat);
  int colorChangeB3 = 1;

  Icon iconB4 = Icon(Icons.event_seat);
  int colorChangeB4 = 1;

  Icon iconB5 = Icon(Icons.event_seat);
  int colorChangeB5 = 1;

  Icon iconB6 = Icon(Icons.event_seat);
  int colorChangeB6 = 1;

  Icon iconB7 = Icon(Icons.event_seat);
  int colorChangeB7 = 1;

  Icon iconB8 = Icon(Icons.event_seat);
  int colorChangeB8 = 1;

  Icon iconB9 = Icon(Icons.event_seat);
  int colorChangeB9 = 1;

  Icon iconB10 = Icon(Icons.event_seat);
  int colorChangeB10 = 1;


  @override
  void initState() {
    FirebaseFirestore.instance.collection("BusInfo").doc("${widget.docMainId}").collection("Details").
    doc("${widget.docId}").collection("Reserve").get().then((querySnapshot){
      querySnapshot.docs.forEach((element){
        String date = element.get("date");

        // values for A side
        String value1 = element.get("seatA1");
        String value2 = element.get("seatA2");
        String value3 = element.get("seatA3");
        String value4 = element.get("seatA4");
        String value5 = element.get("seatA5");
        String value6 = element.get("seatA6");
        String value7 = element.get("seatA7");
        String value8 = element.get("seatA8");
        String value9 = element.get("seatA9");
        String value10 = element.get("seatA10");

        // values for B side

        String value11 = element.get("seatB1");
        String value12 = element.get("seatB2");
        String value13 = element.get("seatB3");
        String value14 = element.get("seatB4");
        String value15 = element.get("seatB5");
        String value16 = element.get("seatB6");
        String value17 = element.get("seatB7");
        String value18 = element.get("seatB8");
        String value19 = element.get("seatB9");
        String value20 = element.get("seatB10");

        if(value1 == "A1" && date == "${widget.date}"){
          setState(() {
            seatA1 = "A1";
            iconA1 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value2 == "A2" && date == "${widget.date}"){
          setState(() {
            seatA2 = "A2";
            iconA2 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value3 == "A3" && date == "${widget.date}"){
          setState(() {
            seatA3 = "A3";
            iconA3 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value4 == "A4" && date == "${widget.date}"){
          setState(() {
            seatA4 = "A4";
            iconA4 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value5 == "A5" && date == "${widget.date}"){
          setState(() {
            seatA5 = "A5";
            iconA5 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value6 == "A6" && date == "${widget.date}"){
          setState(() {
            seatA6 = "A6";
            iconA6 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value7 == "A7" && date == "${widget.date}"){
          setState(() {
            seatA7 = "A7";
            iconA7 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value8 == "A8" && date == "${widget.date}"){
          setState(() {
            seatA8 = "A8";
            iconA8 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value9 == "A9" && date == "${widget.date}"){
          setState(() {
            seatA9 = "A9";
            iconA9 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value10 == "A10" && date == "${widget.date}"){
          setState(() {
            seatA10 = "A10";
            iconA10 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }

        if(value11 == "B1" && date == "${widget.date}"){
          setState(() {
            seatB1 = "B1";
            iconB1 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value12 == "B2" && date == "${widget.date}"){
          setState(() {
            seatB2 = "B2";
            iconB2 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value13 == "B3" && date == "${widget.date}"){
          setState(() {
            seatB3 = "B3";
            iconB3 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value14 == "B4" && date == "${widget.date}"){
          setState(() {
            seatB4 = "B4";
            iconB4 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value15 == "B5" && date == "${widget.date}"){
          setState(() {
            seatB5 = "B5";
            iconB5 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value16 == "B6" && date == "${widget.date}"){
          setState(() {
            seatB6 = "B6";
            iconB6 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value17 == "B7" && date == "${widget.date}"){
          setState(() {
            seatB7 = "B7";
            iconB7 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value18 == "B8" && date == "${widget.date}"){
          setState(() {
            seatB8 = "B8";
            iconB8 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value19 == "B9" && date == "${widget.date}"){
          setState(() {
            seatB9 = "B9";
            iconB9 = Icon(Icons.event_seat,
              color: Colors.red,);
          });
        }
        if(value20 == "B10" && date == "${widget.date}"){
          setState(() {
            seatB10 = "B10";
            iconB10 = Icon(Icons.event_seat,
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
          Text("Seat: $listSeats"),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF07538a)),
              ),
              height: 300.0,
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
                                      listSeats.add("A1");
                                      sA1 = "A1";
                                    });
                                  } else {
                                    setState(() {
                                      total = total - price;
                                      iconA1 = Icon(Icons.event_seat,);
                                      colorChangeA1 = 1;
                                      var index = listSeats.indexOf("A1");
                                      listSeats.removeAt(index);
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
                                    listSeats.add("A2");
                                    sA2 = "A2";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA2 = Icon(Icons.event_seat,);
                                    colorChangeA2 = 1;
                                    var index = listSeats.indexOf("A2");
                                    listSeats.removeAt(index);
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
                              if(seatA3 != "A3"){
                                if (colorChangeA3 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA3 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA3 = 2;
                                    listSeats.add("A3");
                                    sA3 = "A3";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA3 = Icon(Icons.event_seat,);
                                    colorChangeA3 = 1;
                                    var index = listSeats.indexOf("A3");
                                    listSeats.removeAt(index);
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
                                    listSeats.add("A4");
                                    sA4 = "A4";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA4 = Icon(Icons.event_seat,);
                                    colorChangeA4 = 1;
                                    var index = listSeats.indexOf("A4");
                                    listSeats.removeAt(index);
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
                                    listSeats.add("A5");
                                    sA5 = "A5";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA5 = Icon(Icons.event_seat,);
                                    colorChangeA5 = 1;
                                    var index = listSeats.indexOf("A5");
                                    listSeats.removeAt(index);
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
                                    listSeats.add("A6");
                                    sA6 = "A6";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA6 = Icon(Icons.event_seat,);
                                    colorChangeA6 = 1;
                                    var index = listSeats.indexOf("A6");
                                    listSeats.removeAt(index);
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
                            icon: iconA7,
                            onPressed: () {
                              if(seatA7 != "A7"){
                                if (colorChangeA7 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA7 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA7 = 2;
                                    listSeats.add("A7");
                                    sA7 = "A7";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA7 = Icon(Icons.event_seat,);
                                    colorChangeA7 = 1;
                                    var index = listSeats.indexOf("A7");
                                    listSeats.removeAt(index);
                                    sA7 = "";
                                  });
                                }
                              }

                            },
                          ),
                          IconButton(
                            icon: iconA8,
                            onPressed: () {
                              if(seatA8 != "A8"){
                                if (colorChangeA8 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA8 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA8 = 2;
                                    listSeats.add("A8");
                                    sA8 = "A8";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA8 = Icon(Icons.event_seat,);
                                    colorChangeA8 = 1;
                                    var index = listSeats.indexOf("A8");
                                    listSeats.removeAt(index);
                                    sA8 = "";
                                  });
                                }
                              }

                            },
                          ),

                        ],
                      ),


                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconA9,
                            onPressed: () {
                              if(seatA9 != "A9"){
                                if (colorChangeA9 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA9 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA9 = 2;
                                    listSeats.add("A9");
                                    sA9 = "A9";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA9 = Icon(Icons.event_seat,);
                                    colorChangeA9 = 1;
                                    var index = listSeats.indexOf("A9");
                                    listSeats.removeAt(index);
                                    sA9 = "";
                                  });
                                }
                              }

                            },
                          ),
                          IconButton(
                            icon: iconA10,
                            onPressed: () {
                              if(seatA10 != "A10"){
                                if (colorChangeA10 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconA10 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeA10 = 2;
                                    listSeats.add("A10");
                                    sA10 = "A10";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconA10 = Icon(Icons.event_seat,);
                                    colorChangeA10 = 1;
                                    var index = listSeats.indexOf("A10");
                                    listSeats.removeAt(index);
                                    sA10 = "";
                                  });
                                }
                              }

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
                            icon: iconB1,
                            onPressed: () {
                              if(seatB1 != "B1")
                              {
                                if (colorChangeB1 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB1 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB1 = 2;
                                    listSeats.add("B1");
                                    sB1 = "B1";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB1 = Icon(Icons.event_seat,);
                                    colorChangeB1 = 1;
                                    var index = listSeats.indexOf("B1");
                                    listSeats.removeAt(index);
                                    sB1 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconB2,
                            onPressed: () {
                              if(seatB2 != "B2")
                              {
                                if (colorChangeB2 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB2 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB2 = 2;
                                    listSeats.add("B2");
                                    sB2 = "B2";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB2 = Icon(Icons.event_seat,);
                                    colorChangeB2 = 1;
                                    var index = listSeats.indexOf("B2");
                                    listSeats.removeAt(index);
                                    sB2 = "";
                                  });
                                }
                              }
                            },
                          ),

                        ],
                      ),

                      //Second column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconB3,
                            onPressed: () {
                              if(seatB3 != "B3")
                              {
                                if (colorChangeB3 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB3 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB3 = 2;
                                    listSeats.add("B3");
                                    sB3 = "B3";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB3 = Icon(Icons.event_seat,);
                                    colorChangeB3 = 1;
                                    var index = listSeats.indexOf("B3");
                                    listSeats.removeAt(index);
                                    sB3 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconB4,
                            onPressed: () {
                              if(seatB4 != "B4")
                              {
                                if (colorChangeB4 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB4 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB4 = 2;
                                    listSeats.add("B4");
                                    sB4 = "B4";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB4 = Icon(Icons.event_seat,);
                                    colorChangeB4 = 1;
                                    var index = listSeats.indexOf("B4");
                                    listSeats.removeAt(index);
                                    sB4 = "";
                                  });
                                }
                              }
                            },
                          ),

                        ],
                      ),
                      //Third column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconB5,
                            onPressed: () {
                              if(seatB5 != "B5")
                              {
                                if (colorChangeB5 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB5 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB5 = 2;
                                    listSeats.add("B1");
                                    sB5 = "B5";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB5 = Icon(Icons.event_seat,);
                                    colorChangeB5 = 1;
                                    var index = listSeats.indexOf("B5");
                                    listSeats.removeAt(index);
                                    sB5 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconB6,
                            onPressed: () {
                              if(seatB6 != "B6")
                              {
                                if (colorChangeB6 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB6 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB6 = 2;
                                    listSeats.add("B6");
                                    sB6 = "B6";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB6 = Icon(Icons.event_seat,);
                                    colorChangeB6 = 1;
                                    var index = listSeats.indexOf("B6");
                                    listSeats.removeAt(index);
                                    sB6 = "";
                                  });
                                }
                              }
                            },
                          ),

                        ],
                      ),
                      //Forth column
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconB7,
                            onPressed: () {
                              if(seatB7 != "B7")
                              {
                                if (colorChangeB7 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB7 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB7 = 2;
                                    listSeats.add("B7");
                                    sB7 = "B7";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB7 = Icon(Icons.event_seat,);
                                    colorChangeB7 = 1;
                                    var index = listSeats.indexOf("B7");
                                    listSeats.removeAt(index);
                                    sB7 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconB8,
                            onPressed: () {
                              if(seatB8 != "B8")
                              {
                                if (colorChangeB8 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB8 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB8 = 2;
                                    listSeats.add("B8");
                                    sB8 = "B8";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB8 = Icon(Icons.event_seat,);
                                    colorChangeB8 = 1;
                                    var index = listSeats.indexOf("B8");
                                    listSeats.removeAt(index);
                                    sB8 = "";
                                  });
                                }
                              }
                            },
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(height: 45.0,),
                          IconButton(
                            icon: iconB9,
                            onPressed: () {
                              if(seatB9 != "B9")
                              {
                                if (colorChangeB9 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB9 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB9 = 2;
                                    listSeats.add("B9");
                                    sB9 = "B9";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB9 = Icon(Icons.event_seat,);
                                    colorChangeB9 = 1;
                                    var index = listSeats.indexOf("B9");
                                    listSeats.removeAt(index);
                                    sB9 = "";
                                  });
                                }
                              }
                            },
                          ),
                          IconButton(
                            icon: iconB10,
                            onPressed: () {
                              if(seatB10 != "B10")
                              {
                                if (colorChangeB10 == 1) {
                                  setState(() {
                                    total = total + price;
                                    iconB10 = Icon(Icons.event_seat,
                                      color: Colors.lightBlueAccent,);
                                    colorChangeB10 = 2;
                                    listSeats.add("B10");
                                    sB10 = "B10";
                                  });
                                } else {
                                  setState(() {
                                    total = total - price;
                                    iconB10 = Icon(Icons.event_seat,);
                                    colorChangeB10 = 1;
                                    var index = listSeats.indexOf("B10");
                                    listSeats.removeAt(index);
                                    sB10 = "";
                                  });
                                }
                              }
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
              if(FirebaseAuth.instance.currentUser != null){
                if(sA1 != null || sA2 != null || sA3 != null || sA4 != null || sA5 != null || sA6 != null || sA7 != null || sA8 != null || sA9 != null || sA10 != null || sB1 != null|| sB2 != null || sB3 != null || sB4 != null || sB5 != null || sB6 != null || sB7 != null || sB8 != null || sB9 != null || sB10 != null  )
                {
                  _payViaKhalti(context);
//
//                  FirebaseFirestore.instance.collection("BusInfo").doc("${widget.docMainId}")
//                      .collection("Details").doc("${widget.docId}").collection("Reserve").add({
//                    "date": "${widget.date}",
//                    "eMail": "${FirebaseAuth.instance.currentUser.email}",
//                    "total": "$total",
//                    "travelCompany": "${widget.travelCompany}",
//                    "departureTime": "${widget.deptTime}",
//                    "seatA1": "$sA1",
//                    "seatA2": "$sA2",
//                    "seatA3": "$sA3",
//                    "seatA4": "$sA4",
//                    "seatA5": "$sA5",
//                    "seatA6": "$sA6",
//                    "seatA7": "$sA7",
//                    "seatA8": "$sA8",
//                    "seatA9": "$sA9",
//                    "seatA10": "$sA10",
//                    "seatB1": "$sB1",
//                    "seatB2": "$sB2",
//                    "seatB3": "$sB3",
//                    "seatB4": "$sB4",
//                    "seatB5": "$sB5",
//                    "seatB6": "$sB6",
//                    "seatB7": "$sB7",
//                    "seatB8": "$sB8",
//                    "seatB9": "$sB9",
//                    "seatB10": "$sB10",
//                  });
//                  //adding in the database in bookings collection in order for respective user to view the details of bookings
//                  FirebaseFirestore.instance.collection("Bookings").doc().collection("${FirebaseAuth.instance.currentUser.email}").add({
//                    "mainId": "${widget.docMainId}",
//                    "docId": "${widget.docId}",
//                    "docLatestId": "${FirebaseFirestore.instance.collection("Bookings").doc("${FirebaseAuth.instance.currentUser.email}")
//                      .collection("Details").doc("${widget.docId}").collection("Reserve").id}",
//                    "eMail": "${FirebaseAuth.instance.currentUser.email}",
//                    "date": "${widget.date}",
//                    "total": "$total",
//                    "travelCompany": "${widget.travelCompany}",
//                    "departureTime": "${widget.deptTime}",
//                    "from": "${widget.from}",
//                    "to": "${widget.to}",
//                    "busType": "${widget.busType}",
//                    "ticketPrice": "${widget.price}",
//                    "seatA1": "$sA1",
//                    "seatA2": "$sA2",
//                    "seatA3": "$sA3",
//                    "seatA4": "$sA4",
//                    "seatA5": "$sA5",
//                    "seatA6": "$sA6",
//                    "seatA7": "$sA7",
//                    "seatA8": "$sA8",
//                    "seatA9": "$sA9",
//                    "seatA10": "$sA10",
//                    "seatB1": "$sB1",
//                    "seatB2": "$sB2",
//                    "seatB3": "$sB3",
//                    "seatB4": "$sB4",
//                    "seatB5": "$sB5",
//                    "seatB6": "$sB6",
//                    "seatB7": "$sB7",
//                    "seatB8": "$sB8",
//                    "seatB9": "$sB9",
//                    "seatB10": "$sB10",
//                  });
//
//                  Navigator.of(context).pop();
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
              }else{
                showDialog(context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Alert!'),
                        content: Text('User Not Logged In Press Ok to log in'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Profile(),)
                              );
                            },
                          ),
                        ],
                      );
                    });
              }

            },
          ),
          RaisedButton(
            child: Text("Payment"),
            onPressed: (){
              _payViaKhalti(context);
            },
          ),
        ],
      ),
    );
  }

  _payViaKhalti(BuildContext context) {
    FlutterKhalti _flutterKhalti = FlutterKhalti.configure(
      publicKey: "test_public_key_eacadfb91994475d8bebfa577b0bca68",
      urlSchemeIOS: "KhaltiPayFlutterExampleScheme",
    );

    KhaltiProduct product = KhaltiProduct(
      id: "test",
      amount: 1000,
      name: "Hello Product",
    );
    _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data) {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return _bookFinally();
        }));
      },
      onFaliure: (error) {
        print("sorry");
      },
    );
  }

  _bookFinally() {
    if(sA1 != null || sA2 != null || sA3 != null || sA4 != null || sA5 != null || sA6 != null || sA7 != null || sA8 != null || sA9 != null || sA10 != null || sB1 != null|| sB2 != null || sB3 != null || sB4 != null || sB5 != null || sB6 != null || sB7 != null || sB8 != null || sB9 != null || sB10 != null  )
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
        "seatA7": "$sA7",
        "seatA8": "$sA8",
        "seatA9": "$sA9",
        "seatA10": "$sA10",
        "seatB1": "$sB1",
        "seatB2": "$sB2",
        "seatB3": "$sB3",
        "seatB4": "$sB4",
        "seatB5": "$sB5",
        "seatB6": "$sB6",
        "seatB7": "$sB7",
        "seatB8": "$sB8",
        "seatB9": "$sB9",
        "seatB10": "$sB10",
      });
      //adding in the database in bookings collection in order for respective user to view the details of bookings
      FirebaseFirestore.instance.collection("Bookings").doc("${FirebaseAuth.instance.currentUser.email}").collection("Details").add({
        "mainId": "${widget.docMainId}",
        "docId": "${widget.docId}",
        "docLatestId": "${FirebaseFirestore.instance.collection("Bookings").doc("${FirebaseAuth.instance.currentUser.email}")
            .collection("Details").doc("${widget.docId}").collection("Reserve").id}",
        "eMail": "${FirebaseAuth.instance.currentUser.email}",
        "date": "${widget.date}",
        "total": "$total",
        "travelCompany": "${widget.travelCompany}",
        "departureTime": "${widget.deptTime}",
        "from": "${widget.from}",
        "to": "${widget.to}",
        "busType": "${widget.busType}",
        "ticketPrice": "${widget.price}",
        "seatA1": "$sA1",
        "seatA2": "$sA2",
        "seatA3": "$sA3",
        "seatA4": "$sA4",
        "seatA5": "$sA5",
        "seatA6": "$sA6",
        "seatA7": "$sA7",
        "seatA8": "$sA8",
        "seatA9": "$sA9",
        "seatA10": "$sA10",
        "seatB1": "$sB1",
        "seatB2": "$sB2",
        "seatB3": "$sB3",
        "seatB4": "$sB4",
        "seatB5": "$sB5",
        "seatB6": "$sB6",
        "seatB7": "$sB7",
        "seatB8": "$sB8",
        "seatB9": "$sB9",
        "seatB10": "$sB10",
      });
      int count = 2;
      Navigator.of(context).popUntil((_) => count-- <= 0);
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
  }

}
