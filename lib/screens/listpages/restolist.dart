import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:defood/screens/listpages/listmenu.dart';

class RestoList extends StatefulWidget {
  const RestoList({Key key, this.categories}) : super(key: key);
  final String categories;

  @override
  _RestoListState createState() => _RestoListState();
}

class _RestoListState extends State<RestoList> {
  final searchController = TextEditingController();
  CollectionReference resto = FirebaseFirestore.instance.collection('restoran');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cat = ModalRoute.of(context).settings.arguments;
    String param = cat.toLowerCase();
    debugPrint(param);
    return Scaffold(
      appBar: appBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              "Kategori: $cat",
              style: TextStyle(
                color: Color(0xFFBD452C),
                fontFamily: 'Inter',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.46,
            child: StreamBuilder<QuerySnapshot>(
                stream: resto.where('genre_resto',
                    arrayContainsAny: ["$param"]).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  return new InkWell(
                    onTap: () {},
                    child: ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuList(),
                                  settings: RouteSettings(
                                      arguments: document.data()['id_resto']),
                                ));
                          },
                          child: Column(
                            children: <Widget>[
                              listWidget(
                                  document.data()['nama_resto'],
                                  document.data()['genre_resto'],
                                  document.data()['rating'],
                                  document.data()['status']),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
          ),
        )
      ]),
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

  Widget listWidget(nama, genre, rating, status) {
    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            listCards(),
            listImage(),
            cardContent(nama, genre, rating, status),
          ],
        ));
  }

  Widget listImage() {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        alignment: FractionalOffset.centerLeft,
        child: ClipPath(
          child: new Image(
              image: new AssetImage("assets/images/food1.png"),
              fit: BoxFit.cover,
              height: 120.0,
              width: 120.0),
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Widget listCards() {
    return new Container(
      height: 130.0,
      margin: EdgeInsets.only(left: 47.0),
      decoration: BoxDecoration(
          color: Color(0xFFBD452C),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0)),
          ]),
    );
  }

  Widget cardContent(nama, genre, rating, status) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(140.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            nama,
            style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w600),
          ),
          new Container(height: 10.0),
          new Text("Kategori: " + genre[0] + ", " + genre[1],
              style: TextStyle(
                  fontFamily: 'Inter', color: Colors.white, fontSize: 12.0)),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Colors.white),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star_outline_rounded,
                size: 16.0,
                color: Colors.white,
              ),
              new Container(width: 8.0),
              new Text(
                rating.toString(),
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              new Container(width: 24.0),
              new Container(width: 12.0),
              new Text(
                status ? "Buka" : "Tutup",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
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
