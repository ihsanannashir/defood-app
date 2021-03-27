import 'package:creatice/screens/onboard.dart';
import 'package:creatice/screens/pageview/akun.dart';
import 'package:creatice/screens/pageview/beranda.dart';
import 'package:creatice/screens/pageview/keranjang.dart';
import 'package:flutter/material.dart';

class ScreenControlPage extends StatefulWidget {
  @override
  _ScreenControlPageState createState() => _ScreenControlPageState();
}

class _ScreenControlPageState extends State<ScreenControlPage> {
  //PageView
  int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  final PageController controller =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
        controller.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("De-FOOD",
                style: TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.w600)),
            backgroundColor: Color(0xFFBD452C),
            elevation: 0,
            leading: IconButton(
              iconSize: 30,
              icon: Icon(Icons.menu_rounded),
              color: Colors.white,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.favorite_outline),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.chat_bubble_outline),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.notifications_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            automaticallyImplyLeading: false),
        body: buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: Colors.amber[800],
          key: _bottomNavigationKey,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _page = 0;
                    bottomTapped(_page);
                  });
                  debugPrint(_page.toString());
                },
                elevation: 4.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.home,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _page = 1;
                    bottomTapped(_page);
                  });
                  debugPrint(_page.toString());
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.shopping_cart,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              label: "Keranjang",
            ),
            BottomNavigationBarItem(
              icon: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _page = 2;
                    bottomTapped(_page);
                  });
                  debugPrint(_page.toString());
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[Beranda(), Keranjang(), Akun()],
    );
  }
}
