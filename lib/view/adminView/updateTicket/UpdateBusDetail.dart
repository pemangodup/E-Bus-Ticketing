import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/updateTicket/updateBusDetailTile.dart';
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
            'Update User Ticket'
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
              final listFirst = querySnapshot.data.docs;
              return SizedBox(
                height: 200.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listFirst.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("BusInfo").doc(widget.docId).collection("Details").doc(listFirst[index].id).collection("Reserve").snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot ) {
                          if(querySnapshot.hasError){
                            return Text('Error');
                          }
                          if(querySnapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }else{
                            final listSecond = querySnapshot.data.docs;
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: listSecond.length,
                                itemBuilder: (context, index) {
                                  return UpdateBusDetailTile(
                                    depTime: listSecond[index].get("departureTime"),
                                    date: listSecond[index].get("date"),
                                    email: listSecond[index].get("eMail"),
                                    bookedSeat: listSecond[index].get("seat"),
                                    secondDocumentId: listSecond[index].id,
                                    total: listSecond[index].get("total"),
                                    yatayat: listSecond[index].get("travelCompany"),
                                    beginningDocumentId: listFirst[index].id,
                                    startDocId: widget.docId,
                                    );
                                }
                            );
                          }
                        },
                      );
                    }
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

