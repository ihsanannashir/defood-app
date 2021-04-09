import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  static const ID_ORDER = "id_order";
  static const ID_RESTO = "id_resto";
  static const CART = "cart";
  static const UUID = "uuid";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const DELIV_DATE = "deliv_date";
  static const CREATED_AT = "created_at";

  String _id_order;
  String _id_resto;
  String _uuid;
  String _status;
  int _total;
  int _deliv_date;
  int _created_at;

  String get id_order => _id_order;
  String get id_resto => _id_resto;
  String get uuid => _uuid;
  String get status => _status;
  int get total => _total;
  int get deliv_date => _deliv_date;
  int get created_at => _created_at;

  List cart;

  Orders.fromSnapshot(DocumentSnapshot snapshot) {
    _id_order = snapshot.data()[ID_ORDER];
    _id_resto = snapshot.data()[ID_RESTO];
    _uuid = snapshot.data()[UUID];
    _status = snapshot.data()[STATUS];
    _total = snapshot.data()[TOTAL];
    _deliv_date = snapshot.data()[DELIV_DATE];
    _created_at = snapshot.data()[CREATED_AT];
    cart = snapshot.data()[CART];
  }
}
