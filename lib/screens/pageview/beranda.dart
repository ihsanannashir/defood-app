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
  static final List<String> imgTitle = [
    'Promo #1',
    'Promo #2',
    'Promo #3',
    'Promo #4',
    'Promo #5',
  ];
  static final List<String> imgCapt = [
    'This is promo number 1. Great food great price!',
    'This is promo number 2. Great food great price!',
    'This is promo number 3. Great food great price!',
    'This is promo number 4. Great food great price!',
    'This is promo number 5. Great food great price!',
  ];

  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height / 2.7,
                      color: Color(0xFFBD452C),
                    ),
                    searchView(),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: carouselView()),
                  ],
                ),
                trendGrid(),
                catGrid(),
              ],
            ),
          ),
        ));
  }

  Widget searchView() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFFBD452C),
                ),
                labelText: "Ketik...",
                labelStyle: TextStyle(
                  color: Color(0x80BD452C),
                ),
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

  Widget carouselView() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
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
                  color: _currentImage == index ? Colors.grey : Colors.white),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget trendGrid() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text("Sedang Tren",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFFBD452C))),
                new Spacer(),
                IconButton(icon: Icon(Icons.fullscreen), onPressed: () {}),
              ],
            ),
            Container(
              height: 110,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.only(top: 5),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food6.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food7.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food8.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food9.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food1.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food2.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget catGrid() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text("Jelajah Kategori",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFFBD452C))),
                new Spacer(),
                IconButton(icon: Icon(Icons.fullscreen), onPressed: () {}),
              ],
            ),
            Container(
              height: 110,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.only(top: 5),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food3.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food4.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food5.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food6.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food7.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.asset(
                          'assets/images/food2.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
