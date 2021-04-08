import 'package:cloud_firestore/cloud_firestore.dart';

class Menu {
  static const ID_MAKANAN = "id_makanan";
  static const NAMA_MAKANAN = "nama_makanan";
  static const GAMBAR_MAKANAN = "gambar_makanan";
  static const HARGA_MAKANAN = "harga_makanan";
  static const STOK = "stok";

  String _id_makanan;
  String _nama_makanan;
  String _gambar_makanan;
  int _harga_makanan;
  bool _stok;

  String get id_makanan => _id_makanan;
  String get nama_makanan => _nama_makanan;
  String get gambar_makanan => _gambar_makanan;
  int get harga_makanan => _harga_makanan;
  bool get stok => _stok;

  Menu.fromSnapshot(DocumentSnapshot snapshot) {
    _id_makanan = snapshot.data()[ID_MAKANAN];
    _nama_makanan = snapshot.data()[NAMA_MAKANAN];
    _gambar_makanan = snapshot.data()[GAMBAR_MAKANAN];
    _harga_makanan = snapshot.data()[HARGA_MAKANAN];
    _stok = snapshot.data()[STOK];
  }
}
