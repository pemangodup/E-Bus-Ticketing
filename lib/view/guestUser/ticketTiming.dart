import 'package:ebusticketing/view/guestUser/ticketDetailListTile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TicketTiming extends StatefulWidget {
  final String source, destination, date, id;
  TicketTiming({this.source, this.destination, this.date, this.id});

  @override
  _TicketTimingState createState() => _TicketTimingState();
}

class _TicketTimingState extends State<TicketTiming> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text("${widget.source} - ${widget.destination}"),
              SizedBox(height: 1.0,),
              Text("${widget.date}"),
              SizedBox(height: 10.0,),
            ],
          ),
          backgroundColor: Color(0xFF07538a),
        ),
      ),
      backgroundColor: Color(0xFF2f3480),
        body: ListPage(source: widget.source, destination: widget.destination, date: widget.date,),
      );
  }
}

//list page stateful class for design
class ListPage extends StatefulWidget {
  final String source, destination, date;
  String id;
  ListPage({this.source, this.destination, this.date});

  @override
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  int noData = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder<QuerySnapshot>(
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
                    itemCount: list.length,
                    itemBuilder: (context, indexOne) {
                      if(widget.source == list[indexOne].get("From") && widget.destination == list[indexOne].get("To")){
                        return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("BusInfo").doc(list[indexOne].id).collection("Details").snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnap ) {
                            if(querySnap.hasError){
                              return Text("Error");
                            }
                            if(querySnap.connectionState == ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }else{
                              final listOne = querySnap.data.docs;
                              return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listOne.length,
                                  itemBuilder: (context, indexTwo){
                                    return TicketDetailListTile(
                                      docMainId: list[indexOne].id,
                                      docId: listOne[indexTwo].id,
                                      from: widget.source,
                                      to: widget.destination,
                                      date: widget.date,
                                      depTime: listOne[indexTwo].get("DepartureTime"),
                                      arriveTime: listOne[indexTwo].get("ArrivalTime"),
                                      yatayat: listOne[indexTwo].get("TravelCompany"),
                                      ticketPrice: listOne[indexTwo].get("TicketPrice"),
                                      busType: listOne[indexTwo].get("BusType"),
                                    );
                                  }
                              );
                            }
                          },
                        );
                      }else{
                        return SizedBox();
                      }
                    }
              );
            }},
          ));
        }
  }