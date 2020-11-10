import 'package:ebusticketing/view/seat_selection.dart';
import 'package:flutter/material.dart';


class TicketDetailListTile extends StatelessWidget {
  final double depTime;
  final double arriveTime;
  final String yatayat;
  final String busType;
  final double ticketPrice;

  TicketDetailListTile({this.depTime, this.arriveTime, this.yatayat, this.busType, this.ticketPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.greenAccent)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                '$depTime - $arriveTime',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '$yatayat',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '$busType',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              RaisedButton(
                child: Text(
                  'Book Ticket'
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SeatSelection();
                    },
                  ));
                },
                textColor: Colors.white,
              ),

            ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rs. $ticketPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
