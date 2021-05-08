import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final dbRef = FirebaseFirestore.instance;
  bool _passwordVisible = true;

  final _auth = FirebaseAuth.instance;
  String firstName, lastName, email, password, retypePassword;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Color(0xFF07538a),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                 firstName = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    lastName = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    email = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility:Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: (){
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    password = value;
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Retype Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                    retypePassword = value;
                },
              ),
              RaisedButton(
                elevation: 10,
                onPressed: () async{
                  if(firstName != null && lastName != null && email != null && password != null){
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      //save in firestore
                      dbRef.collection('User').doc().set({
                        'email': '${_auth.currentUser.email}',
                        "firstName": '$firstName',
                        'lastName': '$lastName',
                      });
                      if(newUser != null){
                        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                      }
                    }catch(e){
                      print(e);
                    }
                  }else{
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Alert',
                      desc: 'Field empty',
                      btnOkOnPress: () {
                        Navigator.pop(context);
                      },
                    )..show();
                  }
                },
                color: Color(0xFF047cb0),
                child: Text(
                  'Sign Up',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

}


