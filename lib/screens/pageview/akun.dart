import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final searchController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  static String _email, _username;
  String _timeString;

  void getCurrentUser() async {
    User user = await _auth.currentUser;
    setState(() {
      _email = user.email;
    });
    debugPrint(_email);
  }

  void dispose() {
    super.dispose();
  }
  
  void _getDay() {
    final String formattedDateTime = DateFormat('kk').format(DateTime.now());
    setState(() {
      var jam = int.parse(formattedDateTime);
      if (jam >= 2 && jam < 11 ) {
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

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    Timer.periodic(Duration(seconds: 0), (Timer t) => _getDay());
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
                Container (
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Halo, Selamat ${_timeString} ${_email}",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontFamily: 'Inter',
                          )
                      ),
                      SizedBox(height: 15.0),
                    ],
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
