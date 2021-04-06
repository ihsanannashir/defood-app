import 'package:cloud_firestore/cloud_firestore.dart';

class Resto {
  static const ID_RESTO = "id_resto";
  static const NAMA_RESTO = "nama_resto";
  static const GAMBAR_RESTO = "gambar_resto";
  static const ALAMAT = "alamat";
  static const NO_TELEPON = "no_telepon";
  static const JAM_BUKA = "jam_buka";
  static const RATING = "rating";
  static const STATUS = "status";
  static const GENRE_RESTO = "genre_resto";

  String _id_resto;
  String _nama_resto;
  String _gambar_resto;
  String _alamat;
  String _no_telepon;
  String _jam_buka;
  String _rating;
  bool _status;
  List<String> _genre_resto;

  String get id_resto => _id_resto;
  String get nama_resto => _nama_resto;
  String get gambar_resto => _gambar_resto;
  String get alamat => _alamat;
  String get no_telepon => _no_telepon;
  String get jam_buka => _jam_buka;
  String get rating => _rating;
  bool get status => _status;
  List<String> get genre_resto => _genre_resto;

  Resto.fromSnapshot(DocumentSnapshot snapshot) {
    _id_resto = snapshot.data()[ID_RESTO];
    _nama_resto = snapshot.data()[NAMA_RESTO];
    _gambar_resto = snapshot.data()[GAMBAR_RESTO];
    _alamat = snapshot.data()[ALAMAT];
    _no_telepon = snapshot.data()[NO_TELEPON];
    _jam_buka = snapshot.data()[JAM_BUKA];
    _rating = snapshot.data()[RATING];
    _status = snapshot.data()[STATUS];
    _genre_resto = snapshot.data()[GENRE_RESTO];
  }
}
