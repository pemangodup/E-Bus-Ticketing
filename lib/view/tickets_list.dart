import 'package:ebusticketing/view/list_task_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TicketTiming extends StatefulWidget {
  final String source, destination;
  TicketTiming({this.source, this.destination});

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
        body: ListPage(source: widget.source, destination: widget.destination,),
      );
  }
}

//list page stateful class for design
class ListPage extends StatefulWidget {
  final String source, destination;
  final int noData = 0;
  ListPage({this.source, this.destination});

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
                itemBuilder: (context, index) {
                if(list[index]['From']== widget.source && list[index]['To']== widget.destination){
                  return TicketDetailListTile(ticketPrice: list[index]['TicketPrice'],
                      from: list[index]['From'],
                      to: list[index]['To'],
                      busType: list[index]['BusType'],
                      yatayat: list[index]['TravelCompany'],
                      arriveTime: list[index]['ArrivalTime'],
                      depTime: list[index]['DepartureTime']);
                }else{
                  return null;
                }
            });
          }
        },
      ),
    );
  }
}
