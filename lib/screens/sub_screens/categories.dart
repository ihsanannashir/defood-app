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
        itemGrid('assets/images/food1.png'),
        itemGrid('assets/images/food2.png'),
        itemGrid('assets/images/food3.png'),
        itemGrid('assets/images/food4.png'),
        itemGrid('assets/images/food5.png'),
        itemGrid('assets/images/food6.png'),
        itemGrid('assets/images/food7.png'),
        itemGrid('assets/images/food8.png'),
        itemGrid('assets/images/food9.png'),
        itemGrid('assets/images/food1.png'),
        itemGrid('assets/images/food1.png'),
      ],
    );
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
}
