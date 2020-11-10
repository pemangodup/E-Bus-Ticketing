import 'package:ebusticketing/view/task_tile.dart';
import 'package:flutter/material.dart';


class TicketTiming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.greenAccent,
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              TicketDetailListTile(depTime: 10.15 ,
                arriveTime: 15.30,
                yatayat: 'Helambu Yatayat',
                busType: 'Super Bus',
                ticketPrice: 390.0,
              ),
              SizedBox(height: 2.0,),
              TicketDetailListTile(depTime: 10.15 ,
                arriveTime: 15.30,
                yatayat: 'Helambu Yatayat',
                busType: 'Super Bus',
                ticketPrice: 390.0,
              ),
            ],
          ),
        ),
      );
  }
}
