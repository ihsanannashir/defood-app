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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    debugPrint(id);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: resto.where('id_resto', isEqualTo: id).snapshots(),
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
                    title: new Text(document.data()['id_resto']),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}
