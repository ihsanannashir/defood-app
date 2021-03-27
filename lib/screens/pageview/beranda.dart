import 'package:creatice/screens/pageview/widget/carouselview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final searchController = TextEditingController();
  int _currentImage = 0;
  static final List<String> imgSlider = [
    'food1.png',
    'food2.png',
    'food3.png',
    'food4.png',
    'food5.png',
  ];

  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height / 2.3,
                  color: Color(0xFFBD452C),
                ),
                searchView(),
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 25.0),
                    child: carouselView()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselView() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: CarouselSlider(
            items: imgSlider.map((fileImage) {
              return Container(
                child: Image(
                  image: AssetImage('assets/images/${fileImage}'),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImage = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgSlider.map((url) {
            int index = imgSlider.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImage == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget searchView() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            padding: EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFFBD452C),
                ),
                labelText: "Cari...",
                labelStyle: TextStyle(
                  color: Color(0xFFBD452C),
                ),
                hintText: "Cari...",
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 5.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 5.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
