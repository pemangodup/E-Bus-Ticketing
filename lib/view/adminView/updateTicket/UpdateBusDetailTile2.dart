import 'package:flutter/material.dart';



class UpdateBusDetailTile2 extends StatelessWidget {
  final String date;
  final String depTime;
  final String arriveTime;
  final String yatayat;
  final String email;
  final String ticketPrice;
  final String bookedSeat;
  final String total;


  UpdateBusDetailTile2({this.date, this.depTime,
    this.arriveTime, this.total, this.yatayat, this.email, this.ticketPrice, this.bookedSeat,});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Departure: $depTime',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Dept. Date: $date',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  '$yatayat',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Seat: $bookedSeat',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Id: $email',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                RaisedButton(
                  child: Text("Delete"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: Color(0xFF047cb0),
                  onPressed: () {
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Delete?'),
                            content: Text('Delete or Not?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Delete'),
                                onPressed: () {
//                                  _returnBack(context);
                                },
                              ),
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  textColor: Colors.white,
                ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rs. $total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
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
