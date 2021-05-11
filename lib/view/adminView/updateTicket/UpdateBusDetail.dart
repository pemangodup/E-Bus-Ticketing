import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/listBus/adminBusListTile.dart';
import 'package:ebusticketing/view/adminView/updateTicket/UpdateBusDetailTile.dart';
import 'package:ebusticketing/view/adminView/updateTicket/deleteUserTicketTile.dart';
import 'package:flutter/material.dart';



class UpdateBusDetail extends StatefulWidget {
  UpdateBusDetail({this.to, this.from, this.docId});
  final String to , docId, from;
  @override
  _UpdateBusDetailState createState() => _UpdateBusDetailState();
}

class _UpdateBusDetailState extends State<UpdateBusDetail> {
  String from, to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07538a),
        title: Text(
            'List of Ticket'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: StreamBuilder<QuerySnapshot>(
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
                    return UpdateBusDetailTile2(
                      from: widget.from,
                        to: widget.to,
                       beginningDocumentId: widget.docId,
                        yatayat: list[index].get("TravelCompany"),
                        arriveTime: list[index].get("ArrivalTime"),
                        ticketPrice: list[index].get("TicketPrice"),
                        busType: list[index].get("BusType"),
                        depTime: list[index].get("DepartureTime"),
                        secondDocumentId: list[index].id
                    );
                  }
              );
            }
          },
        ),
      ),
    );
  }
}

