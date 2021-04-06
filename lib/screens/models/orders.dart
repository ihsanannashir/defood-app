import 'package:cloud_firestore/cloud_firestore.dart';

class Resto {
  static const ID_ORDER = "id_order";
  static const ID_MAKANAN = "id_makanan";
  static const QUANTITY = "quantity";
  static const ID_RESTO = "id_resto";
  static const HARGA = "harga";

  String _id_order;
  String _id_makanan;
  int _quantity;
  String _id_resto;
  int _harga;

  String get id_order => _id_order;
  String get id_makanan => _id_makanan;
  int get quantity => _quantity;
  String get id_resto => _id_resto;
  int get harga => _harga;

  Resto.fromSnapshot(DocumentSnapshot snapshot) {
    _id_order = snapshot.data()[ID_ORDER];
    _id_makanan = snapshot.data()[ID_MAKANAN];
    _quantity = snapshot.data()[QUANTITY];
    _id_resto = snapshot.data()[ID_RESTO];
    _harga = snapshot.data()[HARGA];
  }
}
