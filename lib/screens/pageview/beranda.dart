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
                      height: MediaQuery.of(context).size.height / 2.9,
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
          padding: EdgeInsets.only(top: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 15.0, 20, 8.0),
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
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
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
                  color: _currentImage == index
                      ? Colors.grey.shade400
                      : Colors.white),
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
                splashColor: Color(0xFFBD452C).withOpacity(0.4),
                onTap: () {},
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    itemsTrending('assets/images/food6.png', 'Discount 50%',
                        'on selected items'),
                    itemsTrending(
                        'assets/images/food7.png', 'Buy 1 Get 1', 'only today'),
                    itemsTrending(
                        'assets/images/food8.png', 'Title', 'caption'),
                    itemsTrending(
                        'assets/images/food9.png', 'Title', 'caption'),
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
                  itemsCat('assets/images/categories/bread.png', 'Bread'),
                  itemsCat('assets/images/categories/desserts.png', 'Desserts'),
                  itemsCat('assets/images/categories/drinks.png', 'Drinks'),
                  itemsCat('assets/images/categories/meat.png', 'Meat'),
                ],
              ),
            )
          ],
        ));
  }

  Widget itemsTrending(image, title, caption) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Card(
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
            )),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.transparent,
            child: ClipPath(
              child: Container(
                height: 50,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFBD452C).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 0, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('$title',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('$caption',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 10,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget itemsCat(image, category) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Card(
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
            )),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.transparent,
            child: ClipPath(
              child: Container(
                height: 30,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFBD452C).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text('$category',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
        ),
      ],
    );
  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
