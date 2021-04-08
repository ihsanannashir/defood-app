import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void initState() {
    super.initState();
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
            height: MediaQuery.of(context).size.height / 6,
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
                    child: ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return new ListTile(
                          title: new Text(document.data()['id_makanan']),
                          subtitle: new Text(
                              document.data()['harga_makanan'].toString()),
                          trailing: new Text(document.data()['nama_makanan']),
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
}
