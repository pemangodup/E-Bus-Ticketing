import 'package:ebusticketing/view/admin_view/add_bus_destination_list_tile.dart';
import 'package:ebusticketing/view/admin_view/bus_detail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../list_task_tile.dart';


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
                            _dbRef.collection("BusInfo").doc().set({"From":from, "To": to});
                            print("Lets see what will get printed **************** ${list[index]}");
                            if(list[index].get("From")==from && list[index].get("To")==to){
                              _dbRef.collection("BusInfo").doc().set({"From":from, "To": to});
                              print("*****************************************************");
                              showDialog(
                                context: context,
                                // ignore: missing_return
                                builder: (context) {
                                  Text("hello");
                                },);
                            }
                            return null;
                          }
                      );
                    }
                  },
                );


//                CheckAlreadyExist();
//                _dbRef.collection("BusInfo").doc().set({"From":from, "To":to});
//                clearFrom.clear();
//                clearTo.clear();
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
                        return AddBusDestinationListTile(from: list[index].get("From"), to: list[index].get("To"),);
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



class CheckAlreadyExist extends StatefulWidget {
  final String from, to;
  CheckAlreadyExist({this.from, this.to});
  @override
  _CheckAlreadyExistState createState() => _CheckAlreadyExistState();
}

class _CheckAlreadyExistState extends State<CheckAlreadyExist> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

