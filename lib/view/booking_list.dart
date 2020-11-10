import 'package:ebusticketing/view/add_bus_detail.dart';
import 'package:flutter/material.dart';


class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) {
                      return AddBusDetail();
                    },));
                  },
                  elevation: 10,
                  color: Colors.white70,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
