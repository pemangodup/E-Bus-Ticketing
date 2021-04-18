import 'package:flutter/material.dart';

class UpdateBusDetailTile extends StatelessWidget {
  final String date;
  final String depTime;
  final String arriveTime;
  final String yatayat;
  final String busType;
  final String ticketPrice;
  final String beginningDocumentId;
  final String secondDocumentId;

  UpdateBusDetailTile({this.date, this.beginningDocumentId, this.depTime,
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
                          'Update'
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Color(0xFF047cb0),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return null;//UpdateBusDetail(travelCompany: yatayat, ticketPrice: ticketPrice, to: to, from: from,
                                //busType: busType, arrivalTime: arriveTime, depTime: depTime, documentId: beginningDocumentId, secondDocumentId: secondDocumentId);
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
                        fontSize: 15.0,
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
