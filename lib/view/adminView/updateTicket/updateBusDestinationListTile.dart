import 'package:flutter/material.dart';
import 'UpdateBusDetail.dart';



class UpdateBusDestinationListTile extends StatefulWidget {
  final String from, to, docId;
  UpdateBusDestinationListTile({this.from, this.to, this.docId});
  @override
  _UpdateBusDestinationListTileState createState() => _UpdateBusDestinationListTileState();
}

class _UpdateBusDestinationListTileState extends State<UpdateBusDestinationListTile> {
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
                  '${widget.from} - ${widget.to}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RaisedButton(
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    child: Text('Update'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>UpdateBusDetail(from: widget.from, to: widget.to, docId: widget.docId,)));
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
