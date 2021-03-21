import 'package:ebusticketing/view/admin_view/listBus/admin_listAll.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class BusListTile extends StatefulWidget {
  final String from, to, docId;
  BusListTile({this.from, this.to, this.docId});
  @override
  _BusListTileState createState() => _BusListTileState();
}

class _BusListTileState extends State<BusListTile> {
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
                    child: Text('List'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ListAll(docId: widget.docId, from: widget.from, to: widget.to,)));
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

