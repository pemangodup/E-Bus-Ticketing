import 'package:ebusticketing/view/seatSelection.dart';
import 'package:flutter/material.dart';


class TicketDetailListTile extends StatefulWidget {
  final String from;
  final String to;
  final String date;
  final String depTime;
  final String arriveTime;
  final String yatayat;
  final String busType;
  final String ticketPrice;

  TicketDetailListTile({this.date, this.depTime, this.arriveTime, this.yatayat, this.busType, this.ticketPrice, this.to, this.from});

  @override
  _TicketDetailListTileState createState() => _TicketDetailListTileState();
}

class _TicketDetailListTileState extends State<TicketDetailListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SeatSelection(
              to: widget.to,
              from: widget.from,
              date: widget.date,
              travelCompany: widget.yatayat,
              price: widget.ticketPrice,
              time: widget.depTime,
              busType: widget.busType,
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFF047cb0))
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
                    'Departure Time: ${widget.depTime}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                SizedBox(height: 10.0,),
                Text(
                  '${widget.yatayat}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '${widget.busType}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  SizedBox(height: 10.0),
//                RaisedButton(
//                  child: Text(
//                    'Book Ticket'
//                  ),
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//                  color: Color(0xFF047cb0),
//                  onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(
//                      builder: (context) {
//                        return SeatSelection();
//                      },
//                    ));
//                  },
//                  textColor: Colors.white,
//                ),
              ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Rs. ${widget.ticketPrice}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
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
