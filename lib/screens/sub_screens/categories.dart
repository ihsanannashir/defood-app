import 'dart:ui';

import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Text(
                "Semua Kategori",
                style: TextStyle(
                  color: Color(0xFFBD452C),
                  fontFamily: 'Inter',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: gridCat(),
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("De-FOOD",
          style:
              TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600)),
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
    );
  }

  Widget gridCat() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        items('assets/images/categories/bread.png', 'Bread'),
        items('assets/images/categories/desserts.png', 'Desserts'),
        items('assets/images/categories/drinks.png', 'Drinks'),
        items('assets/images/categories/fast_food.png', 'Fast Food'),
        items('assets/images/categories/healthy_food.png', 'Healthy Food'),
        items('assets/images/categories/meat.png', 'Meat'),
        items('assets/images/categories/noodles.png', 'Noodles'),
        items('assets/images/categories/pizza.png', 'Pizza'),
        items('assets/images/categories/rice.png', 'Rice'),
        items('assets/images/categories/snacks.png', 'Snacks'),
      ],
    );
  }

  Widget items(image, category) {
    return Stack(
      alignment: Alignment.center,
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
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFBD452C).withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$category',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ],
        ),
      ],
    );
  }
}
