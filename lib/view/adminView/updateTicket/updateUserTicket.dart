import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/updateTicket/updateBusDestinationListTile.dart';
import 'package:flutter/material.dart';



class UpdateUserProfile extends StatefulWidget {
  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {


  final clearFrom = TextEditingController();
  final clearTo = TextEditingController();
  String id;
  String mailId, date;

  //for date picker pop up
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if(picked != null){
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return UpdateBusDestinationListTile(from: list[index].get("From"), to: list[index].get("To"), docId: list[index].id,);
                  }
              );
            }
          },
        )
      ),
    );
  }
}
