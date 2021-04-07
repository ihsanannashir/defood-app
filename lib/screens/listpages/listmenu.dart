import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  bool _anchorToBottom = false;
  CollectionReference resto = FirebaseFirestore.instance.collection('restoran');
  CollectionReference menu = FirebaseFirestore.instance.collection('menu');
  final searchController = TextEditingController();
  int quantity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.initState();
  }

  _plusCounter() {
    setState(() {
      quantity++;
    });
  }

  _minusCounter() {
    setState(() {
      quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    debugPrint(id);
    return Scaffold(
      appBar: appBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 220,
              color: Color(0xFFBD452C),
            ),
            searchView(),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 230, 20, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.sort,
                        size: 24,
                        color: Color(0xFFBD452C),
                      ),
                      Container(width: 10.0),
                      Text(
                        "Sort",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFBD452C)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 90, 0, 0),
              child: StreamBuilder<QuerySnapshot>(
                  stream: resto.where('id_resto', isEqualTo: id).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return new Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    width: 75.0,
                                    height: 75.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: new NetworkImage(document
                                                .data()['gambar_resto'])))),
                                Container(width: 30),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(document.data()['nama_resto'],
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400)),
                                      Text('Deskripsi restoran',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400)),
                                      Container(width: 0.0, height: 30.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                width: 0.0),
                            Row(
                              children: [
                                Icon(Icons.star, size: 25, color: Colors.white),
                                Container(width: 10.0, height: 0.0),
                                Text(document.data()['rating'].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400)),
                                Container(width: 160.0, height: 0.0),
                                Icon(
                                  Icons.timer,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                Container(width: 10.0, height: 0.0),
                                Text(document.data()['jam_buka'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        ),
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.520,
            child: StreamBuilder<QuerySnapshot>(
                stream: menu
                    .where('id_makanan',
                        isGreaterThanOrEqualTo: id,
                        isLessThanOrEqualTo: id + 'z')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return new InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          children: snapshot.data.docs
                              .map((DocumentSnapshot document) {
                            return new InkWell(
                                onTap: () {
                                  detailMenu(
                                      document.data()['nama_makanan'],
                                      document.data()['harga_makanan'],
                                      document.data()['gambar_makanan']);
                                },
                                child: menuItems(
                                    document.data()['nama_makanan'],
                                    document.data()['harga_makanan'],
                                    document.data()['gambar_makanan']));
                          }).toList(),
                        ),
                      ));
                }),
          ),
        )
      ]),
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

  Widget menuItems(nama, harga, gambar) {
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
                    child: Image.network(
                      gambar,
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
                height: MediaQuery.of(context).size.height,
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
          padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
          child: Text(nama,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(harga.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              )),
        ),
      ],
    );
  }

  Future<void> detailMenu(nama, harga, gambar) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        StreamController<String> controller =
            StreamController<String>.broadcast();
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFBD452C),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: ClipPath(
                            child: Image.network(gambar, fit: BoxFit.cover),
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        nama,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Deskripsi makanan yang enak banget, ini enak banget, ini pokoknya deskripsi makanan!',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              CupertinoIcons.minus_circle_fill,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () => controller.add(
                                  quantity != 0 ? _minusCounter() : null,
                                )),
                        Container(width: 20),
                        StreamBuilder(
                            stream: controller.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return Text(
                                  snapshot.hasData
                                      ? snapshot.data
                                      : quantity.toString(),
                                  style: TextStyle(color: Colors.white));
                            }),
                        Container(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () => controller.add(_plusCounter()),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            quantity = 0;
                            Navigator.pop(context);
                          },
                        ),
                        new Spacer(),
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: Text('Add to cart',
                              style: TextStyle(color: Color(0xFFBD452C))),
                          onPressed: () {
                            if (quantity == 0) {
                              _showToast(context,
                                  'Quantity is zero. \nItems not added to cart');
                              Navigator.pop(context);
                            } else {
                              _showToast(context,
                                  'Successfully added $quantity $nama to cart!');
                              quantity = 0;
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showToast(BuildContext context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 3),
        backgroundColor: Color(0xFFBD452C),
      ),
    );
  }
}
