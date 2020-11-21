import 'package:ebusticketing/view/list_task_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TicketTiming extends StatefulWidget {
  @override
  _TicketTimingState createState() => _TicketTimingState();
}

class _TicketTimingState extends State<TicketTiming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07538a),
      ),
      backgroundColor: Color(0xFF2f3480),
        body: ListPage(),
      );
  }
}

//list page stateful class for design
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
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
              return TicketDetailListTile(ticketPrice: list[index]['TicketPrice'], busType: list[index]['BusType'], yatayat: list[index]['TravelCompany'], arriveTime: list[index]['ArrivalTime'], depTime: list[index]['DepartureTime']);
            });
          }
        },
      ),
    );
  }
}
