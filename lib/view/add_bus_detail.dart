
import 'package:flutter/material.dart';

class AddBusDetail extends StatefulWidget {
  @override
  _AddBusDetailState createState() => _AddBusDetailState();
}

class _AddBusDetailState extends State<AddBusDetail> {
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

  //for time picker
 Widget _timePicker(String textLabel, TextEditingController x, Function y){
    return TextField(
      controller: x,
      decoration: InputDecoration(
        labelText: textLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: () {
        y(context);
      },
    );
 }


  //widget to enter text data
  Widget _textField(String textLabel){
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: textLabel,
        errorText: _inputIsValid ? null: 'Please fill the field',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Add Bus Detail'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Enter Bus Detail Data'),
            ),
            _timePicker(
                'Departure Time',
                _timeControllerDeparture,
                selectTimeDeparture,
            ),
            SizedBox(height: 10.0,),
            _timePicker(
              'Arrival Time',
              _timeControllerArrival,
              selectTimeArrival,
            ),
            SizedBox(height: 10.0,),
            _textField('Travel Company'),
            SizedBox(height: 10.0,),
            _textField('Bus Type'),
            SizedBox(height: 10.0,),
            _numField('Ticket Price'),
            SizedBox(height: 10.0,),
            RaisedButton(
              onPressed: () {
                print(depTime);
              },
              color: Colors.lightGreen,
              child: Text('Save'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
