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
  bool _anchorToBottom = false;
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
      body: StreamBuilder<QuerySnapshot>(
          stream: resto
              .where('genre_resto', arrayContainsAny: ["$param"]).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return new InkWell(
              onTap: () {},
              child: ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuList(),
                            settings: RouteSettings(
                                arguments: document.data()['id_resto']),
                          ));
                    },
                    title: new Text(document.data()['id_resto']),
                    subtitle: new Text(document.data()['nama_resto']),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}