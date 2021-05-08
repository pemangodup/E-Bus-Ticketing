import 'package:flutter/material.dart';
import 'admin_add_bus_detail.dart';





class AddBusDestinationListTile extends StatelessWidget {
  final String from, to, docId;
  AddBusDestinationListTile({this.from, this.to, this.docId});
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
                RaisedButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  child: Text('Add'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BusDetail(from: from, to: to, docId: docId,)));
                  }
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
