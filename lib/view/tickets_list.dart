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
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.greenAccent,
        body: ListPage(),
      );
  }
}


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

            return ListView.builder(itemBuilder: (context, index){
              return ListUI(list[index]['DepartureTime'], list[index]['ArrivalTime']);
            });
          }
        },
      ),
    );
  }
}

class ListUI extends StatelessWidget {
  String depTime, arrivalTime;
  ListUI(this.depTime, this.arrivalTime);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(depTime),
        Text(arrivalTime),
      ],
    );
  }
}

