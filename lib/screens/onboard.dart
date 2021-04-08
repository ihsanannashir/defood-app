import 'dart:math';
import 'package:defood/screens/login.dart';
import 'package:defood/screens/screencontrol.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFBD452C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('/assets/images/food1.png'),
                  )),
            ),
            Text(
              "Selamat Datang",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "De-Food merupakan aplikasi yang menyediakan berbagai makanan dan minuman yang murah dan terjangkau terutama untuk kalangan mahasiswa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFBD452C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('/assets/images/food2.png'),
                  )),
            ),
            Text(
              "Fitur Utama Kami",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "Kami menyediakan pesanan pengiriman terjadwal yang gratis dan anda juga bisa memesan terlebih dahulu melalui aplikasi tanpa antri lalu ambil sendiri di tempat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFBD452C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('/assets/images/food2.png'),
                  )),
            ),
            Text(
              "Sudah Siap?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "Jangan lupa ajak teman anda untuk menikmati fitur yang kami sediakan, dapatkan poin yang bisa ditukarkan apa saja setiap anda mengajak teman.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            enableLoop: false,
            pages: pages,
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
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 700);
                },
                child: page != pages.length - 1
                    ? Text("Skip to End", style: TextStyle(color: Colors.white))
                    : null,
              ),
            ),
          ),
          if (page == pages.length - 1)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Go to app",
                      style: TextStyle(color: Color(0xFFBD452C))),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

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

  Future navigateToLogin(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenControlPage()));
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
