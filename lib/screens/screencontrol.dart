import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:defood/screens/pageview/akun.dart';
import 'package:defood/screens/pageview/beranda.dart';
import 'package:defood/screens/pageview/keranjang.dart';
import 'package:flutter/material.dart';

class ScreenControlPage extends StatefulWidget {
  @override
  _ScreenControlPageState createState() => _ScreenControlPageState();
}

class _ScreenControlPageState extends State<ScreenControlPage> {
  //PageView
  int _page = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("De-FOOD",
                style: TextStyle(
                    fontFamily: 'Inter', fontWeight: FontWeight.w600)),
            backgroundColor: Color(0xFFBD452C),
            elevation: 0,
            leading: IconButton(
              iconSize: 30,
              icon: Icon(Icons.menu_rounded),
              color: Colors.white,
              onPressed: () {},
            ),
            actions: <Widget>[
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        onPageChanged(index);
      },
      children: <Widget>[Beranda(), Keranjang(), Akun()],
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
