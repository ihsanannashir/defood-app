import 'dart:ui';

import 'package:defood/screens/listpages/restolist.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height / 10,
                color: Color(0xFFBD452C),
              ),
              searchView(),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
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
          ),
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

  List imageList = [
    'bread',
    'desserts',
    'drinks',
    'fast_food',
    'healthy_food',
    'meat',
    'noodle',
    'pizza',
    'rice',
    'snacks'
  ];
  List textList = [
    'Bread',
    'Desserts',
    'Drinks',
    'Fast Food',
    'Healthy Food',
    'Meat',
    'Noodles',
    'Pizza',
    'Rice',
    'Snacks'
  ];
  Widget gridCat() {
    return GridView.builder(
      itemCount: textList.length,
      primary: false,
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print(textList[index]);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestoList(),
                  settings: RouteSettings(arguments: imageList[index]),
                ));
          },
          child: items('assets/images/categories/' + imageList[index] + '.png',
              textList[index]),
        );
      },
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
}
