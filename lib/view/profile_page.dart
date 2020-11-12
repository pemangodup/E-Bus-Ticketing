import 'package:ebusticketing/view/sign_up.dart';
import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    print('login');
                  },
                  color: Colors.white70,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                  elevation: 10,
                ),
              ),
              SizedBox(width: 5.0,),
              Expanded(
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SignUp();
                    },));
                  },
                  color: Colors.white70,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
