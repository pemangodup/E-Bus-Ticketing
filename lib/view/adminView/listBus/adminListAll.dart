import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'adminBusListTile.dart';



class ListAll extends StatefulWidget {
  final String docId, from, to;
  ListAll({this.docId, this.from, this.to});
  @override
  _ListAllState createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List"),),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("BusInfo").doc(widget.docId).collection("Details").snapshots(),
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
                  return AdminBusListTile(from: widget.from, to: widget.to,
                    beginningDocumentId: widget.docId, yatayat: list[index].get("TravelCompany"), arriveTime: list[index].get("ArrivalTime"),
                    ticketPrice: list[index].get("TicketPrice"), busType: list[index].get("BusType"),
                    depTime: list[index].get("DepartureTime"),secondDocumentId: list[index].id);
                }
            );
          }
        },
      ),
    );
  }
}
