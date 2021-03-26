import 'package:ebusticketing/view/guestUser/locationSearch.dart';
import 'package:ebusticketing/view/guestUser/ticketTiming.dart';
import 'package:flutter/material.dart';



class SearchFrame extends StatefulWidget {
  @override
  _SearchFrameState createState() => _SearchFrameState();
}

class _SearchFrameState extends State<SearchFrame> {



  //initializing search bar controller
  final TextEditingController searchOriginController = TextEditingController();
  final TextEditingController searchDestinationController = TextEditingController();

  //variable to store source and destination point
  String source, destination, date;

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
                    TextField(
                      controller: searchOriginController,
                      decoration: InputDecoration(
                        hintText: "Insert Origin"
                      ),
                      onTap: () async{
                        String val = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LocationSearch(location: "From",);
                        }));
                        setState(() {
                          searchOriginController.text = val;
                          source = val;
                        });
                      },
                    ),

                      SizedBox(height: 20,),

                    TextField(
                      decoration: new InputDecoration(
                        hintText: "Insert Destination",
                      ),
                      controller: searchDestinationController,
                      onTap: () async{
                       String val = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LocationSearch(location: "To",);
                        }));
                       setState(() {
                         searchDestinationController.text = val;
                         destination = val;
                       });
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
                          date = '${_date.year.toString()}:${_date.month.toString()}:${_date.day.toString()}'
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
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
                                    return TicketTiming(source: source, destination: destination, date: date);
                                },
                                ));
                          }else{
                            showDialog(context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text('Alert!'),
                                content: Text('Field Empty'),
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


