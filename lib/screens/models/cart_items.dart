import 'package:cloud_firestore/cloud_firestore.dart';

class CartItems {
  static const ID_CART = "id_cart";
  static const ID_MAKANAN = "id_makanan";
  static const NAMA_MAKANAN = "id_makanan";
  static const HARGA_MAKANAN = "harga_makanan";
  static const QUANTITY = "quantity";
  static const ID_RESTO = "id_resto";

  String _id_cart;
  String _id_makanan;
  String _nama_makanan;
  int _harga_makanan;
  int _quantity;
  String _id_resto;

  String get id_cart => _id_cart;
  String get id_makanan => _id_makanan;
  String get nama_makanan => _nama_makanan;
  int get harga => _harga_makanan;
  int get quantity => _quantity;
  String get id_resto => _id_resto;

  CartItems.fromMap(Map data) {
    _id_cart = data[ID_CART];
    _id_makanan = data[ID_MAKANAN];
    _nama_makanan = data[NAMA_MAKANAN];
    _harga_makanan = data[HARGA_MAKANAN];
    _quantity = data[QUANTITY];
    _id_resto = data[ID_RESTO];
  }
  Map toMap() => {
        ID_CART: _id_cart,
        ID_MAKANAN: _id_makanan,
        NAMA_MAKANAN: _nama_makanan,
        HARGA_MAKANAN: _harga_makanan,
        QUANTITY: _quantity,
        ID_RESTO: _id_resto
      };
}
