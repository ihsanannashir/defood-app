import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:styled_text/styled_text.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final searchController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static String _email, _username, _fullname;
  String _timeString;
  Timer _timer;

  void getCurrentUser() async {
    User user = await _auth.currentUser;
    setState(() {
      _email = user.email;
    });
    debugPrint(_email);
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getDay() {
    final String formattedDateTime = DateFormat('kk').format(DateTime.now());
    setState(() {
      var jam = int.parse(formattedDateTime);
      if (jam >= 2 && jam < 11) {
        _timeString = "Pagi";
      } else if (jam >= 11 && jam < 15) {
        _timeString = "Siang";
      } else if (jam >= 15 && jam < 18) {
        _timeString = "Sore";
      } else if (jam >= 18 && jam < 2) {
        _timeString = "Malam";
      }
    });
  }

  void getUserName() {
    var firebaseUser = _auth.currentUser;
    _db.collection("users").doc(firebaseUser.uid).get().then((value){
      //TEST DEBUG
      print(value.data()["username"]);
      print(value.data()["fullname"]);
      _fullname = value.data()["fullname"];
      _username = value.data()["username"];
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getUserName();
    _timer = Timer.periodic(Duration(seconds: 0), (Timer t) => _getDay());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA53C27),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Halo, Selamat ${_timeString} ${_username}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontFamily: 'Inter',
                            )
                        ),
                        SizedBox(height: 15.0),
                        _thumb(),
                        SizedBox(height: 20.0),
                        Text(
                          'Nama Lengkap',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          _fullname,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Nama Pengguna',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          _username,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Alamat Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          _email,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _thumb() {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 5,
      runSpacing: 5,
      children: [
        Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 70.0,
        ),
        StyledText(
          text: '<white><bold><big>${_username}</big></bold><br/><small>Pengguna</small></white>',
          styles: {
            'bold': TextStyle(fontWeight: FontWeight.bold),
            'white': TextStyle(color: Colors.white),
            'big': TextStyle(fontSize: 30.0,),
            'small': TextStyle(fontSize: 20.0),
          },
        )
      ],
    );
  }

}
