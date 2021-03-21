import 'package:ebusticketing/view/admin_view/listBus/bus_list_tile.dart';
import 'package:flutter/material.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


//Listing the list of origin and destination in order to update de
class AdminBusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bus List'),
          backgroundColor: Color(0xFF07538a),
        ),
        body: StreamBuilder<QuerySnapshot>(
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
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return BusListTile(from: list[index].get("From"), to: list[index].get("To"), docId: list[index].id,);
                  }
              );
            }
          },
        ),
      ),
    );
  }
}

