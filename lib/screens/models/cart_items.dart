import 'package:cloud_firestore/cloud_firestore.dart';

class CartItems {
  static const ID_CART = "id_cart";
  static const ID_MAKANAN = "id_makanan";
  static const NAMA_MAKANAN = "nama_makanan";
  static const HARGA_MAKANAN = "harga_makanan";
  static const QUANTITY = "quantity";
  static const ID_RESTO = "id_resto";
  static const TOTAL_HARGA_ITEM = "total_harga_item";

  String _id_cart;
  String _id_makanan;
  String _nama_makanan;
  int _harga_makanan;
  int _quantity;
  String _id_resto;
  int _totalHargaItem;

  String get id_cart => _id_cart;
  String get id_makanan => _id_makanan;
  String get nama_makanan => _nama_makanan;
  int get harga_makanan => _harga_makanan;
  int get quantity => _quantity;
  String get id_resto => _id_resto;
  int get totalHargaItem => _totalHargaItem;

  CartItems.fromMap(Map data) {
    _id_cart = data["id_cart"];
    _id_makanan = data["id_makanan"];
    _nama_makanan = data["nama_makanan"];
    _harga_makanan = data["harga_makanan"];
    _quantity = data["quantity"];
    _id_resto = data["id_resto"];
    _totalHargaItem = data["total_harga_item"];
  }
  Map toMap() => {
        "id_cart": _id_cart,
        "id_makanan": _id_makanan,
        "nama_makanan": _nama_makanan,
        "harga_makanan": _harga_makanan,
        "quantity": _quantity,
        "id_resto": _id_resto,
        "total_harga_item": _totalHargaItem
      };
}
