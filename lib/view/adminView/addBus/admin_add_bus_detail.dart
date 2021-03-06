import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




//this is the class to add all the detail information of the bus
class BusDetail extends StatefulWidget {
  BusDetail({this.to, this.from, this.docId});
  final String to , docId;
  final String from;
  @override
  _BusDetailState createState() => _BusDetailState();
}

class _BusDetailState extends State<BusDetail> {
  String from, to;
  final _dbRef = FirebaseFirestore.instance;

  bool _inputIsValid = true;
  String depTime, arrivalTime, travelCompany, busType, busNo, ticketPrice;
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
      arrivalTime = _timeOfDay.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07538a),
        title: Text(
            'Add Bus Detail'
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
                labelText: 'Departure Time',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                depTime = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Arrival Time',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                arrivalTime = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Travel Company',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                travelCompany = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Bus Type',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                busType = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Bus No.',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                busNo = value;
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ticket Price',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                ticketPrice = value;
              },
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              onPressed: () {
                if(depTime!=null && arrivalTime!=null && travelCompany!=null && busType!=null && ticketPrice!=null ) {
                      _dbRef.collection('BusInfo').doc(widget.docId).collection('Details').doc().set({
                        'DepartureTime': depTime,
                        'ArrivalTime': arrivalTime,
                        'TravelCompany': travelCompany,
                        'BusType': busType,
                        'BusNo': busNo,
                        'TicketPrice': ticketPrice,
                  }).then((value) => print('******************** Added to ${_dbRef.collection('BusInfo')
                          .doc(widget.docId)} *********************'));
//                if(depTime!=null && arrivalTime!=null && travelCompany!=null && busType!=null && ticketPrice!=null ) {
//                  _dbRef.collection('Comments').doc().set({
//                    'DepartureTime': depTime,
//                    'TravelCompany': travelCompany,
//                    'BusType': busType,
//                  });
//                }
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.INFO,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Alert',
                  desc: 'Got Added',
                  btnOkOnPress: () {
                    Navigator.pop(context);
                    },
                )..show();
                }else{
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Alert',
                    desc: 'Some field are empty',
                    btnOkOnPress: () {
                      Navigator.pop(context);
                    },
                  )..show();
                }
              },
              color: Color(0xFF047cb0),
              child: Text('Add'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
