import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admin_add_bus_destination_list_tile.dart';


class AddBusDetail extends StatefulWidget {
  @override
  _AddBusDetailState createState() => _AddBusDetailState();
}

class _AddBusDetailState extends State<AddBusDetail> {

  final _dbRef = FirebaseFirestore.instance;
  final clearFrom = TextEditingController();
  final clearTo = TextEditingController();
  String id;
  bool _inputIsValid = true;
  String from, to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07538a),
        title: Text(
          'Add Bus Destination'
        ),
        centerTitle: true,
      ),
      body:

      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: clearFrom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'From',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                from = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: clearTo,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'To',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                to = value;
              },
            ),
            RaisedButton(
              onPressed: () {
                if(from != null && to != null){
                  _dbRef.collection("BusInfo").doc().set({"From":from, "To":to});
                  _dbRef.collection("Comments").doc().set({"From":from, "To":to});
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Notification',
                    desc: 'Added To Database..',
                    btnOkOnPress: () {},
                  )..show();
                  clearFrom.clear();
                  clearTo.clear();
                }else{
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Alert',
                    desc: 'Field empty.............',
                    btnOkOnPress: () {},
                  )..show();
                }

              },
              color: Color(0xFF047cb0),
              child: Text('Save'),
              textColor: Colors.white,
            ),
            SizedBox(height: 10,),
            StreamBuilder<QuerySnapshot>(
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
                        return AddBusDestinationListTile(from: list[index].get("From"), to: list[index].get("To"), docId: list[index].id,);
                      }
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
