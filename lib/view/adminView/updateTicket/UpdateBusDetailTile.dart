import 'package:ebusticketing/view/adminView/updateTicket/deleteUserTicketTile.dart';
import 'package:flutter/material.dart';



class UpdateBusDetailTile2 extends StatelessWidget {
  final String from;
  final String to;
  final String depTime;
  final String arriveTime;
  final String yatayat;
  final String busType;
  final String ticketPrice;
  final String beginningDocumentId;
  final String secondDocumentId;


  UpdateBusDetailTile2({this.from, this.to, this.beginningDocumentId, this.depTime,
    this.arriveTime, this.yatayat, this.busType, this.ticketPrice, this.secondDocumentId});
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: new Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                      '$from - $to',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$busType',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                          'List of Ticket'
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Color(0xFF047cb0),
                      onPressed: () {

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
        ));
  }
}
