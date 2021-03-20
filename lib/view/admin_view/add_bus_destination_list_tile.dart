import 'package:flutter/material.dart';



class AddBusDestinationListTile extends StatelessWidget {
  final String from, to;
  AddBusDestinationListTile({this.from, this.to});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFF047cb0))
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$from - $to',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}
