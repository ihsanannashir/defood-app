import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = <Widget>[
    Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xFFFF7B96)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 180, 35, 40),
            child: Lottie.asset('assets/animations/onboard1.json',
                width: 2000, fit: BoxFit.fill),
          ),
          Text(
            "Welcome to AppName!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'FrankRuhlLibre',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          Text(
            "We are here to help you to \norder food without having to\npay a lot of money",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
            ),
          )
        ],
      ),
    ),
    Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xFFFFA27B)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 130, 35, 40),
            child: Lottie.asset('assets/animations/onboard2.json',
                width: 250, fit: BoxFit.fill),
          ),
          Text(
            "Hmm...?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'FrankRuhlLibre',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          Text(
            "Having a hard time choosing food?\nCheck our recommendation menu\nand order for later",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
            ),
          )
        ],
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 70, 0, 20),
      decoration: BoxDecoration(color: Color(0xFFFFE47B)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 130, 0, 20),
            child: Lottie.asset('assets/animations/onboard3.json',
                width: 200, fit: BoxFit.fill),
          ),
          Text(
            "Don't worry and be FULL!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'FrankRuhlLibre',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          Text(
            "With AppName, you can choose\nfrom variety of foods\nfrom sweets to salty to\ndelicious boba drinks, YUM!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
            ),
          )
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            positionSlideIcon: 0.8,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 700);
                },
                child:
                    Text("Skip to End", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  liquidController.jumpToPage(
                      page: liquidController.currentPage + 1 > pages.length - 1
                          ? 0
                          : liquidController.currentPage + 1);
                },
                child: Text("Next", style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
