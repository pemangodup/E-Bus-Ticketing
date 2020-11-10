import 'package:flutter/material.dart';


class SeatSelection extends StatefulWidget {
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Center(
              child: Column(
                children: <Widget>[
                  Text('Seat Selection'),
                  Text('Helambu Yatayat',
                  style: TextStyle(fontSize: 15.0),),
                ],
              )
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent),
              ),
              height: 500.0,
              width: 230.0,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //First column
                  Column(
                    children: <Widget>[
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ), IconButton(
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ),
                    ],
                  ),

                  //Second column
                  Column(
                    children: <Widget>[
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ), IconButton(
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.0,
                  ),

                  //Third column
                  Column(
                    children: <Widget>[
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ), IconButton(
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ),
                    ],
                  ),
                  //Forth column
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.person),
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
                      IconButton(
                        icon: Icon(Icons.event_seat),
                        onPressed: () {
                          //TODO select if not selected otherwise dis select if selected and cant change if it has already been booked.
                        },
                      ), IconButton(
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
          ),
      ),
    );
  }
}

