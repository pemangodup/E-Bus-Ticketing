import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/admin_view/AdminBusListTile.dart';
import 'package:flutter/material.dart';

import '../list_task_tile.dart';



class AdminBusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bus List'),
          backgroundColor: Color(0xFF07538a),
        ),
        body: BusList(),
      ),
    );
  }
}
//list of bus in tile
class BusList extends StatefulWidget {
  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("BusDetail").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot ) {
            if(querySnapshot.hasError){
              return Text('Error');
            }
            if(querySnapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else{
              final list = querySnapshot.data.docs;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index){
                  return AdminBusListTile(documentId: list[index].id, from: list[index]['From'], to: list[index]['To'], ticketPrice: list[index]['TicketPrice'], busType: list[index]['BusType'], yatayat: list[index]['TravelCompany'], arriveTime: list[index]['ArrivalTime'], depTime: list[index]['DepartureTime']);
              });
            }
          },
        ));
  }
}
