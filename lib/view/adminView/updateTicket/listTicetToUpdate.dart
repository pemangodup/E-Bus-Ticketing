import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/updateTicket/listTicketToUpdateTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ListTicketToUpdate extends StatefulWidget {
  final String mailId;
  ListTicketToUpdate({this.mailId});
  @override
  _ListTicketToUpdateState createState() => _ListTicketToUpdateState();
}

class _ListTicketToUpdateState extends State<ListTicketToUpdate> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String seatA1, seatA2, seatA3, seatA4, seatA5, seatA6;
  var selectedSeats = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update User Ticket"),),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("BusInfo").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot ) {
          if(querySnapshot.hasError){
            return Text('Error');
          }
          if(querySnapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else{
            final list = querySnapshot.data.docs;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  print("****************");
                  return Text("hello");
                }
            );
          }
        },
      ),
//      Column(
//        children: <Widget>[
//          Text("$id"),
//          StreamBuilder<QuerySnapshot>(
//            stream: FirebaseFirestore.instance.collection("Bookings").doc(id).collection("Details").snapshots(),
//            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
//              if(querySnapshot.hasError){
//                return Text("error");
//              }
//              if(querySnapshot.connectionState == ConnectionState.waiting){
//                return Center(child: CircularProgressIndicator());
//              }else{
//                final list = querySnapshot.data.docs;
//                return Expanded(
//                  child: ListView.builder(
//                    scrollDirection: Axis.vertical,
//                    itemCount: list.length,
//                    itemBuilder: (context, index){
//                      print("*********&&&&**************${widget.mailId}");
//                      return ListTicketToUpdateTile(
//                        userEmailId: _auth.currentUser.email,
//                        docId: list[index].get("docId"),
//                        busType: list[index].get("busType"),
//                        date: list[index].get("date"),
//                        from: list[index].get("from"),
//                        to: list[index].get("to"),
//                        ticketPrice: list[index].get("ticketPrice"),
//                        yatayat: list[index].get("travelCompany"),
//                        depTime: list[index].get("departureTime"),
//                        seats: selectedSeats,
//                      );
//                    },
//                  ),
//                );
//              }
//            },
//          ),
//
//        ],
//      )
    );
  }
}
