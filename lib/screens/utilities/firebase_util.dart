import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _restoRef;
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

  DatabaseReference getResto() {
    return _restoRef;
  }

  void dispose() {
    _messagesSubscription.cancel();
  }
}
