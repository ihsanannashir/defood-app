import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/models/resto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/sub_screens/categories.dart';
import 'package:defood/screens/utilities/firebase_util.dart';
import 'package:defood/screens/utilities/service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RestoList extends StatefulWidget {
  const RestoList({Key key, this.categories}) : super(key: key);
  final String categories;

  @override
  _RestoListState createState() => _RestoListState();
}

class _RestoListState extends State<RestoList> {
  FirebaseDatabaseUtil dbUtil;
  bool _anchorToBottom = false;
  DatabaseService service;

  @override
  void initState() {
    super.initState();
    dbUtil = new FirebaseDatabaseUtil();
    dbUtil.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cat = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: FirebaseAnimatedList(
      key: new ValueKey<bool>(_anchorToBottom),
      query: dbUtil.getResto(),
      reverse: _anchorToBottom,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        return new SizeTransition(
          sizeFactor: animation,
          child: showResto(snapshot),
        );
      },
    )
        // body: StreamBuilder<List<Resto>>(
        //   stream: _service.getRestoLists(cat),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.waiting:
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       default:
        //         return ListView(
        //           children: makeListWidget(snapshot),
        //         );
        //     }
        //   },
        // ),
        );
  }

  Widget showResto(DataSnapshot res) {
    Resto resto = Resto.fromSnapshot(res);

    String text = resto.menu[0].toString();
    List<String> listMenu = text.split(',').toList();
    debugPrint(text);
    debugPrint((listMenu[1])
        .toString()
        .trim()
        .replaceAll(new RegExp(r'[^\w\s]+'), ''));

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          resto.id_resto,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          resto.menu[0],
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          resto.genre_resto[0],
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
    );
    return item;
  }
}
