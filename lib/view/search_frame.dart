import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusticketing/view/tickets_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class SearchFrame extends StatefulWidget {
  @override
  _SearchFrameState createState() => _SearchFrameState();
}

class _SearchFrameState extends State<SearchFrame> {

  //variable to store source and destination point
  String source;
  String destination;

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
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Color(0xFF047cb0),
            height: 292.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                        stream: firestore.FirebaseFirestore.instance.collection('BusDetail').orderBy('From').snapshots(),
                        builder: (context, snapshot){
                          List<DropdownMenuItem> cityName =[];
                          if(!snapshot.hasData){
                            Text('Loading');
                          }
                          else{
                            for(int i = 0; i<snapshot.data.docs.length; i++){
                              firestore.DocumentSnapshot snap = snapshot.data.docs[i];
                              cityName.add(DropdownMenuItem(
                                child: Text(
                                  snap.get('From'),
                                  style: TextStyle(color: Color(0xff111b719)),
                                ),
                                value: "${snap.get('From')}",
                              )
                              );
                            }
                          }
                          return DropdownButton(
                            items: cityName,
                            onChanged: (newValue) {
                              setState(() {
                                source = newValue;
                              });
                            },
                            value: source,
                            isExpanded: true,
                            hint: Text('Enter Source Point'),
                          );
                        },
                      ),
                    SizedBox(height: 20.0),
                    StreamBuilder<QuerySnapshot>(
                      stream: firestore.FirebaseFirestore.instance.collection('BusDetail').orderBy('To').snapshots(),
                      builder: (context, snapshot){
                        List<DropdownMenuItem> cityName =[];
                        if(!snapshot.hasData){
                          Text('Loading');
                        }
                        else{
                          for(int i = 0; i<snapshot.data.docs.length; i++){
                            firestore.DocumentSnapshot snap = snapshot.data.docs[i];
                            cityName.add(DropdownMenuItem(
                              child: Text(
                                snap.get('To'),
                                style: TextStyle(color: Color(0xff111b719)),
                              ),
                              value: "${snap.get('To')}",
                            )
                            );
                          }
                        }
                        return DropdownButton(
                          items: cityName,
                          onChanged: (newValue) {
                            setState(() {
                              destination = newValue;
                            });
                          },
                          value: destination,
                          isExpanded: true,
                          hint: Text('Enter Destination Point'),
                        );
                      },
                    ),

                    SizedBox(height: 20.0),
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
                          '${_date.year.toString()}:${_date.month.toString()}:${_date.day.toString()}'
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFF047cb0),
                        child: Text(
                          'Search',
                        ),
                        onPressed: () {
                          if(source !=null && destination != null && _date != null){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TicketTiming();
                                },
                                ));
                          }else{
                            showDialog(context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text('Alert!'),
                                content: Text('Field Empty...'),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
