import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'deleteUserTicketTile.dart';




class DeleteUserTicket extends StatefulWidget {
  final String beginningDocumentId;
  final String secondDocumentId;

  DeleteUserTicket({this.beginningDocumentId, this.secondDocumentId});

  @override
  _DeleteUserTicketState createState() => _DeleteUserTicketState();
}

class _DeleteUserTicketState extends State<DeleteUserTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket List"),
      ),
      body:  StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("BusInfo").doc(widget.beginningDocumentId).collection("Details").doc(widget.secondDocumentId).collection("Reserve").snapshots(),
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
                                    return UpdateBusDetailTile(
                                      startDocId: widget.beginningDocumentId,
                                      beginningDocumentId: widget.secondDocumentId,
                                      secondDocumentId: list[index].id,
                                      email: list[index].get("eMail"),
                                      bookedSeat: list[index].get("seat"),
                                      date: list[index].get("date"),
                                      depTime:list[index].get("departureTime") ,
                                      total: list[index].get("total"),
                                      yatayat: list[index].get("travelCompany"),
                                    );
                                  }
                              );
                            }
                          },
                        ),
    );
  }
}
