import 'package:flutter/material.dart';

class AddBusDetail extends StatefulWidget {
  @override
  _AddBusDetailState createState() => _AddBusDetailState();
}

class _AddBusDetailState extends State<AddBusDetail> {
  bool _inputIsValid = true;
  String depTime, arrivalTime, travelCompany, busType, ticketPrice;
  TimeOfDay _timeOfDay= TimeOfDay.now();
  TimeOfDay pickedDeparture;
  TimeOfDay pickedArrival;
  TextEditingController _timeController = TextEditingController();

  //method to pick time from the watch
  Future<Null> selectTimeDeparture(BuildContext context) async{
    pickedDeparture = await showTimePicker(
        context: context,
        initialTime: _timeOfDay
    );
    _timeController.text = pickedDeparture.format(context);
    setState(() {
      _timeOfDay = pickedDeparture;
    });
  }

  //method to pick time from the watch
  Future<Null> selectTimeArrival(BuildContext context) async{
    pickedArrival = await showTimePicker(
        context: context,
        initialTime: _timeOfDay
    );
    _timeController.text = pickedArrival.format(context);
    setState(() {
      _timeOfDay = pickedArrival;
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
    );
  }

  //for departure time picker
 Widget _timePickerDeparture(String textLabel){
    return TextField(
      controller: _timeController,
      decoration: InputDecoration(
        labelText: textLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: () {
        selectTimeDeparture(context);
      },
    );
 }


  //for arrival time picker
  Widget _timePickerArrival(String textLabel){
    return TextField(
      controller: _timeController,
      decoration: InputDecoration(
        labelText: textLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: () {
        selectTimeArrival(context);
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
            _timePickerDeparture('Departure Time'),
            SizedBox(height: 10.0,),
            _timePickerArrival(
              'Arrival Time',
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
                print('Data Saved');
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
