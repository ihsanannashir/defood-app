<<<<<<< HEAD
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:defood/screens/pageview/akun.dart';
import 'package:defood/screens/pageview/beranda.dart';
import 'package:defood/screens/pageview/keranjang.dart';
=======
import 'package:creatice/screens/onboard.dart';
import 'package:creatice/screens/pageview/akun.dart';
import 'package:creatice/screens/pageview/beranda.dart';
import 'package:creatice/screens/pageview/keranjang.dart';
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
import 'package:flutter/material.dart';

class ScreenControlPage extends StatefulWidget {
  @override
  _ScreenControlPageState createState() => _ScreenControlPageState();
}

class _ScreenControlPageState extends State<ScreenControlPage> {
  //PageView
  int _page = 0;
<<<<<<< HEAD
  PageController _pageController =
=======

  GlobalKey _bottomNavigationKey = GlobalKey();

  final PageController controller =
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
=======
  }

  void pageChanged(int index) {
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
<<<<<<< HEAD
        _pageController.animateToPage(index,
=======
        controller.animateToPage(index,
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
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
<<<<<<< HEAD
            actions: <Widget>[
=======
            actions: [
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
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
<<<<<<< HEAD
        bottomNavigationBar: BottomNavyBar(
          iconSize: 26,
          backgroundColor: Color(0xFFBD452C),
          containerHeight: MediaQuery.of(context).size.height / 15,
          selectedIndex: _page,
          onItemSelected: (index) {
            setState(() => _page = index);
            bottomTapped(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: Text('Beranda'),
              icon: Icon(Icons.home),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              title: Text('Keranjang'),
              icon: Icon(Icons.shopping_cart),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              title: Text('Akun'),
              icon: Icon(Icons.account_circle),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              textAlign: TextAlign.center,
=======
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
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
<<<<<<< HEAD
      controller: _pageController,
      onPageChanged: (index) {
        onPageChanged(index);
=======
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
      },
      children: <Widget>[Beranda(), Keranjang(), Akun()],
    );
  }
}
