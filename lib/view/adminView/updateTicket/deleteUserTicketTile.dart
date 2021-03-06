import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UpdateBusDetailTile extends StatelessWidget {



  final String date;
  final String depTime;
  final String yatayat;
  final String email;
  final String bookedSeat;
  final String total;
  final String beginningDocumentId;
  final String secondDocumentId;
  final String startDocId;

  UpdateBusDetailTile({this.date, this.beginningDocumentId, this.depTime,
     this.total, this.yatayat, this.email, this.bookedSeat, this.secondDocumentId, this.startDocId});

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
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.TOPSLIDE,
                          title: 'Delete',
                          desc: "Continue with the process",
                          btnOkOnPress: (){
                            FirebaseFirestore.instance.collection("BusInfo").doc(startDocId).collection("Details").doc(beginningDocumentId).collection("Reserve").doc(secondDocumentId).delete().catchError((e){
                              print(e);
                            });
                          },
                          btnCancelOnPress: (){
                            print("cancel");
                          },
                        ).show();
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
        ));
  }
}
