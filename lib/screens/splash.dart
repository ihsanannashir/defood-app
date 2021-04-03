import 'dart:async';
import 'package:defood/screens/login.dart';
import 'package:defood/screens/onboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //Position and animation initialization
  double startPos = 1.0;
  double endPos = 0.35;
  Curve curve = Curves.elasticOut;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(milliseconds: 4200);
    return Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return Container(
              decoration: BoxDecoration(
                color: Color(0xFFBD452C),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.directions_bike,
                          size: MediaQuery.of(context).size.width / 3,
                          color: Colors.white,
                        ),
                        new Material(
                            color: Colors.transparent,
                            child: Center(
                                child: Text('AppName',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.white))))
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

  //Screen transition
  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (context, animation, animationTime, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              if (_seen) {
                return LoginPage();
              } else {
                prefs.setBool('seen', true);
                return OnBoard();
              }
            }));
  }
}
