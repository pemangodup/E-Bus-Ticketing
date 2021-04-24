import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class UpdateBusDetail extends StatefulWidget {
  String documentId, from, to, depTime, arrivalTime, travelCompany, busType, ticketPrice, secondDocumentId;
  UpdateBusDetail( {this.from, this.to, this.documentId, this.depTime, this.arrivalTime, this.travelCompany, this.busType, this.ticketPrice, this.secondDocumentId});
  @override
  _UpdateBusDetailState createState() => _UpdateBusDetailState();
}

class _UpdateBusDetailState extends State<UpdateBusDetail> {

  FirebaseFirestore fb = FirebaseFirestore.instance;
  bool _inputIsValid = true;
  TimeOfDay _timeOfDay= TimeOfDay.now();
  TimeOfDay picked;
  TextEditingController _timeControllerDeparture = TextEditingController();
  TextEditingController _timeControllerArrival = TextEditingController();

  //method to pick time from the watch for departure field
  Future<Null> selectTimeDeparture(BuildContext context) async{
    picked = await showTimePicker(
        context: context,
        initialTime: _timeOfDay
    );
    _timeControllerDeparture.text = picked.format(context);
    setState(() {
      _timeOfDay = picked;
    });
  }

  //method to pick time from the watch for arrival field
  Future<Null> selectTimeArrival(BuildContext context) async{
    picked = await showTimePicker(
        context: context,
        initialTime: _timeOfDay
    );
    _timeControllerArrival.text = picked.format(context);
    setState(() {
      _timeOfDay = picked;
      widget.arrivalTime = _timeOfDay.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07538a),
        title: Text(
            'Update Bus Detail'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.from,
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.from = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.to,
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.to = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: '${widget.depTime}',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.depTime = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: '${widget.arrivalTime}',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                  widget.arrivalTime = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: '${widget.travelCompany}',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.travelCompany = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: '${widget.busType}',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.busType = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '${widget.ticketPrice}',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                widget.ticketPrice = value;
              },
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              onPressed: () {
                updateData();
              },
              color: Color(0xFF047cb0),
              child: Text('Update'),
              textColor: Colors.white,
            ),
            RaisedButton(
              child: Text('Delete'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                deleteData();
              },
            )
          ],
        ),
      ),
    );
  }

  void updateData() {
    fb.collection('BusInfo').doc(widget.documentId).collection("Details").doc(widget.secondDocumentId).update({
      "ArrivalTime": "${widget.arrivalTime}",
      "BusType":"${widget.busType}",
      "DepartureTime": "${widget.depTime}",
      "TicketPrice": "${widget.ticketPrice}",
      "TravelCompany": "${widget.travelCompany}",
    }).catchError((e){
      print("error $e");
    });
    Navigator.pop(context);
  }

  void deleteData() {
    fb.collection("BusInfo").doc(widget.documentId).collection("Details").doc(widget.secondDocumentId).delete().catchError((e){
      print(e);
    });
    Navigator.pop(context);
  }
}
