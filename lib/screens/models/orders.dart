import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  static const ID_ORDER = "id_order";
  static const ID_RESTO = "id_resto";
  static const CART = "cart";
  static const UUID = "uuid";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id_order;
  String _id_resto;
  String _uuid;
  String _status;
  int _total;
  int _createdAt;

  String get id_order => _id_order;
  String get id_resto => _id_resto;
  String get uuid => _uuid;
  String get status => _status;
  int get total => _total;
  int get createdAt => _createdAt;

  List cart;

  Orders.fromSnapshot(DocumentSnapshot snapshot) {
    _id_order = snapshot.data()[ID_ORDER];
    _id_resto = snapshot.data()[ID_RESTO];
    _uuid = snapshot.data()[UUID];
    _status = snapshot.data()[STATUS];
    _total = snapshot.data()[TOTAL];
    _createdAt = snapshot.data()[CREATED_AT];
    cart = snapshot.data()[CART];
  }
}
