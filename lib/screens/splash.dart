import 'dart:async';
import 'package:flutter/material.dart';
import './login.dart';

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

  //Screen transition
  void navigationPage() {
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
              return LoginPage();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 1],
                colors: [Colors.blue, Colors.white])),
        child: Stack(
          children: [
            containerAnimation(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.directions_bike,
                    size: MediaQuery.of(context).size.width / 3,
                    color: Colors.blue,
                  ),
                  new Material(
                      color: Colors.transparent,
                      child: Center(
                          child: Text('AppName',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Colors.blue))))
                ],
              ),
            ),
          ],
        ));
  }

  Widget containerAnimation() {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(0, startPos), end: Offset(0, endPos)),
      duration: Duration(milliseconds: 2000),
      curve: curve,
      builder: (context, offset, child) {
        return FractionalTranslation(
          translation: offset,
          child: Container(
            width: double.infinity,
            child: Center(
              child: child,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(150))),
      ),
      onEnd: () {
        print('onEnd');
        Future.delayed(
          Duration(milliseconds: 600),
          () {
            curve = curve == Curves.elasticOut
                ? Curves.elasticIn
                : Curves.elasticOut;
            if (startPos == 1) {
              setState(() {
                startPos = 0.0;
                endPos = -1.0;
              });
            }
          },
        );
      },
    );
  }
}
