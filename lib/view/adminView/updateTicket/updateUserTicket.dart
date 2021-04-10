import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/adminView/updateTicket/listTicetToUpdate.dart';
import 'package:flutter/material.dart';



class UpdateUserProfile extends StatefulWidget {
  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {


  final clearFrom = TextEditingController();
  final clearTo = TextEditingController();
  String id;
  bool _inputIsValid = true;
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
        child: ListView(
          children: <Widget>[
            TextField(
              controller: clearFrom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'mailId',
                errorText: _inputIsValid ? null: 'Please fill the field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  mailId = value;
                });
              },
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    selectDate(context);
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                    date = '${_date.year.toString()}:${_date.month.toString()}:${_date.day.toString()}'
                ),
              ],
            ),
            SizedBox(height: 20,),
            RaisedButton(
              color: Color(0xFF047cb0),
              child: Text('Search'),
              textColor: Colors.white,
              onPressed: () async{
                if(mailId != null){
                  print("$mailId");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListTicketToUpdate(mailId: mailId,)),
                  );
                }else{
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Alert!'),
                          content: Text('$mailId...'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
