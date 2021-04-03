import 'package:defood/screens/models/resto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  List<Resto> getResto() {
    Query db = FirebaseDatabase.instance.reference().child("resto");
    print(db); // to debug and see if data is returned

    List<Resto> resto;

    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        resto.add(Resto.fromSnapshot(values));
      });
    });

    return resto;
  }
}
