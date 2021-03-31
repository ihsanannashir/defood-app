import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:defood/screens/sub_screens/categories.dart';

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
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipPath(
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/images/${fileImage}'),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ));
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
                IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesPage()));
                    }),
              ],
            ),
            Container(
              height: 120,
              child: InkWell(
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    itemGrid('assets/images/food6.png'),
                    itemGrid('assets/images/food7.png'),
                    itemGrid('assets/images/food8.png'),
                    itemGrid('assets/images/food9.png'),
                    itemGrid('assets/images/food1.png'),
                    itemGrid('assets/images/food2.png'),
                    itemGrid('assets/images/food3.png'),
                  ],
                ),
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
                IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesPage()));
                    }),
              ],
            ),
            Container(
              height: 120,
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  itemGrid('assets/images/food3.png'),
                  itemGrid('assets/images/food4.png'),
                  itemGrid('assets/images/food5.png'),
                  itemGrid('assets/images/food6.png'),
                  itemGrid('assets/images/food7.png'),
                  itemGrid('assets/images/food8.png'),
                  itemGrid('assets/images/food9.png'),
                ],
              ),
            )
          ],
        ));
  }

  Widget itemGrid(image) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ClipPath(
          child: Container(
            child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Image.asset(
                  '$image',
                  fit: BoxFit.cover,
                )),
          ),
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
