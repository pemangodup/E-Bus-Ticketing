import 'package:flutter/material.dart';



class LocationSearchTile extends StatelessWidget {
  final String location;
  LocationSearchTile({this.location});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(Icons.location_on) ,
            SizedBox(width: 10.0,),
            Text(
            "$location"
            )

          ],
        ),
      ),
    );
  }
}
