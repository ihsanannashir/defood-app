import 'dart:async';

import 'package:defood/screens/models/resto.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseUtil {
  Query _restoRef;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    // Demonstrates configuring to the database using a file
    // Demonstrates configuring the database directly

    _restoRef = database.reference().child('resto');
  }

  DatabaseError getError() {
    return error;
  }

  Query getResto(String cat) {
    List index = [0, 1, 2];
    for (var x = 0; x < index.length; x++) {
      return _restoRef.equalTo(cat);
    }
    return _restoRef;
  }
}
