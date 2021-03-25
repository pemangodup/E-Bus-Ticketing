
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/guestUser/locationSearchTile.dart';
import 'package:flutter/material.dart';


class LocationSearch extends StatefulWidget {
  final String location;
  LocationSearch({this.location});
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Selection"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('BusInfo').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
          if(querySnapshot.hasError){
            return Text("Error");
          }
          if(querySnapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else{
            final list = querySnapshot.data.docs;
            final orientation = MediaQuery.of(context).orientation;
            return GridView.builder(
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 10),
              ),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.pop(context, "${list[index].get("${widget.location}")}");
                  },
                    child: LocationSearchTile(location: list[index].get("${widget.location}"),)
                );
              },
            );
          }
        },
      ),
    );
  }
}
