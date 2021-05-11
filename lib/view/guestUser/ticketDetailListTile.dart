import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/guestUser/seatSelectionAndReserve.dart';
import 'package:ebusticketing/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebusticketing/services/sentiment.dart';




//This clas is a tile for listing out the list of bus available for a particular route
class TicketDetailListTile extends StatefulWidget {
  final String docMainId;
  final String docId;
  final String from;
  final String to;
  final String date;
  final String depTime;
  final String arriveTime;
  final String yatayat;
  final String busType;
  final String ticketPrice;
  final int response;

  TicketDetailListTile({this.response, this.docMainId, this.docId, this.date, this.depTime, this.arriveTime, this.yatayat, this.busType, this.ticketPrice, this.to, this.from});

  @override
  _TicketDetailListTileState createState() => _TicketDetailListTileState();
}

class _TicketDetailListTileState extends State<TicketDetailListTile> {

  String comment;
  String apiResponse="positive";
  int firebaseResponse, response3 = 0;

  @override
  void initState() {
    try {
      FirebaseFirestore.instance.collection("Comments").doc(
          "${widget.docMainId}").collection("ListComments").doc(widget.docId).get().then((querySnapshot) {
        firebaseResponse = querySnapshot.get("response");
        setState(() {
          response3 = firebaseResponse;
        });
      });
    }catch(e){
      print(e);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: (){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.SCALE,
          body: Column(
            children: <Widget>[
              Text("Feedback"),
              TextField(
                onChanged: (value) {
                  setState(() {
                    comment = value;
                  });
                },
              ),
            ],
          ),
          btnCancelOnPress: () {
          },
          btnOkText: 'Feedback',
          btnOkOnPress: () {
            //method for sentiment response
            if(firebaseResponse == null){
              if(apiResponse=="negative"){
                FirebaseFirestore.instance.collection("Comments").doc(widget.docMainId).collection("ListComments").doc(widget.docId).set({
                  "docId": widget.docId,
                  "response": -1,
                }).then((value) => print('******************** Commented to *********************'));
                setState(() {
                  response3 = -1;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
              }else if(apiResponse == "positive"){
                FirebaseFirestore.instance.collection("Comments").doc(widget.docMainId).collection("ListComments").doc(widget.docId).set({
                  "docId": widget.docId,
                  "response": 1,
                }).then((value) => print('******************** Commented to *********************'));
                setState(() {
                  response3 = 1;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
              }
            }else{
              //int the case where comment on the bus is already available
              if(apiResponse=="positive"){
                FirebaseFirestore.instance.collection('Comments').doc(widget.docMainId).collection("ListComments").doc(widget.docId).update({
                  "docId": widget.docId,
                  "response": firebaseResponse +1,
                }).catchError((e){
                  print("error $e");
                });
                setState(() {
                  response3 = firebaseResponse +1;
                });
                Navigator.pop(context);
              }else if(apiResponse == "negative"){
                FirebaseFirestore.instance.collection('Comments').doc(widget.docMainId).collection("ListComments").doc(widget.docId).update({
                  "docId": widget.docId,
                  "response": firebaseResponse -1,
                }).catchError((e){
                  print("error $e");
                });
                setState(() {
                  response3 = firebaseResponse -1;
                });
                Navigator.pop(context);
              }
            }

          },
        )..show();
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SeatSelection(
              docMainId: widget.docMainId,
              docId: widget.docId,
              to: widget.to,
              from: widget.from,
              date: widget.date,
              travelCompany: widget.yatayat,
              price: widget.ticketPrice,
              time: widget.depTime,
              busType: widget.busType,
              deptTime: widget.depTime,
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
              ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RatingBarIndicator(
                    rating: response3.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),

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

