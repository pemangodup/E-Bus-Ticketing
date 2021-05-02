import 'package:flutter/material.dart';



class ProfileDetailTile extends StatelessWidget {

  final String firstName, lastName;
  ProfileDetailTile(this.firstName, this.lastName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("$firstName $lastName"),
        ],
      ),
    );
  }
}
