import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/guestUser/userBookingsListTile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Booking extends StatefulWidget {

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;



  String seatA1, seatA2, seatA3, seatA4, seatA5, seatA6;
  var selectedSeats = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Bookings").doc("${_auth.currentUser.email}").collection("Details").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
                if(querySnapshot.hasError){
                  return Text("error");
                }
                if(querySnapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else{
                  final list = querySnapshot.data.docs;
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                        itemBuilder: (context, index){
                        return BookingsListTile(
                          userEmailId: _auth.currentUser.email,
                          docId: list[index].get("docId"),
                          busType: list[index].get("busType"),
                          date: list[index].get("date"),
                          from: list[index].get("from"),
                          to: list[index].get("to"),
                          ticketPrice: list[index].get("ticketPrice"),
                          yatayat: list[index].get("travelCompany"),
                          depTime: list[index].get("departureTime"),
                          seats: selectedSeats,
                        );
                        },
                    ),
                  );
                }
              },
            ),


          ],
        ),
      ),
    );
  }
}
