import 'package:flutter/material.dart';


class SeatSelection extends StatefulWidget {
  final String date, price, time, travelCompany, from, to, busType;
  SeatSelection({this.date, this.price, this.time, this.from, this.to, this.travelCompany, this.busType});
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  Icon iconA1 = Icon(Icons.event_seat);
  int colorChangeA1 = 1;

  Icon iconA2 = Icon(Icons.event_seat);
  int colorChangeA2 = 1;

  int total = 0;
  String seats = "";
  @override
  Widget build(BuildContext context) {
    int price = int.parse(widget.price);


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                Text("${widget.to}"),
                Text("${widget.travelCompany}"),
                SizedBox(height: 10.0,),
              ],
            ),
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
          Text("Seat: $seats"),
          SizedBox(height: 50.0,),
          Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF07538a)),
                  ),
                  height: 250.0,
                  width: 250.0,
                  child:  Row(
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
                                  if(colorChangeA1 == 1 && seats != "A1"){
                                    setState(() {
                                      total = total+price;
                                      iconA1 = Icon(Icons.event_seat, color: Colors.lightBlueAccent,);
                                      colorChangeA1 = 2;
                                      seats = seats + " A1";
                                    });
                                  }else{
                                    setState(() {
                                      total = total-price;
                                      iconA1 = Icon(Icons.event_seat,);
                                      colorChangeA1 = 1;
                                      seats = "";
                                    });
                                  }
                                  },
                              ),
                              IconButton(
                                icon: iconA2,
                                onPressed: () {
                                  if(colorChangeA2 == 1){
                                    setState(() {
                                      total = total+price;
                                      iconA2 = Icon(Icons.event_seat, color: Colors.lightBlueAccent,);
                                      colorChangeA2 = 2;
                                      seats = seats + " A2";
                                    });
                                  }else{
                                    setState(() {
                                      total = total-price;
                                      iconA2 = Icon(Icons.event_seat,);
                                      colorChangeA2 = 1;
                                      seats = "";
                                    });
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
                          //Third Row
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

