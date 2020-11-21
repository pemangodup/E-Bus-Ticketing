import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddBusDetail extends StatefulWidget {
  @override
  _AddBusDetailState createState() => _AddBusDetailState();
}

class _AddBusDetailState extends State<AddBusDetail> {

  final _dbRef = FirebaseFirestore.instance;

  bool _inputIsValid = true;
  String depTime, arrivalTime, travelCompany, busType, ticketPrice;
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

  // widget to enter numerical data
  Widget _numField(String numLabel){
    return  TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: numLabel,
        errorText: _inputIsValid ? null: 'Please fill the field',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (value) {
        ticketPrice = value;
      },
    );
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
                if(depTime!=null && arrivalTime!=null && travelCompany!=null && busType!=null && ticketPrice!=null){
                  _dbRef.collection('BusDetail').add({
                    'DepartureTime': depTime,
                    'ArrivalTime': arrivalTime,
                    'TravelCompany': travelCompany,
                    'BusType': busType,
                    'TicketPrice': ticketPrice,
                  }).then((value) => print('Bus detail Added'));
                }
              },
              color: Color(0xFF047cb0),
              child: Text('Save'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
