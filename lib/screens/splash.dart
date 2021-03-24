import 'dart:async';
import 'package:flutter/material.dart';
import './home.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context, 
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, animationTime, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, animationTime) {
          return HomePage();
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset('assets/images/line.jpg', //REPLACE SAMA LOGO
              width: MediaQuery.of(context).size.width / 2,
              ),
              new Text(
                'NAMA APP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}