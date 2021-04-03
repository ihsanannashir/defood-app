import 'package:firebase_database/firebase_database.dart';

class Resto {
  String id_resto;
  String nama_resto;
  String gambar_resto;
  String alamat;
  String no_telepon;
  String jam_buka;
  String rating;
  bool status;
  List<String> genre_resto;
  List<String> menu;

  Resto(
      {this.id_resto,
      this.nama_resto,
      this.gambar_resto,
      this.alamat,
      this.no_telepon,
      this.jam_buka,
      this.genre_resto,
      this.rating,
      this.status,
      this.menu});
  Resto.fromSnapshot(DataSnapshot snapshot)
      : id_resto = snapshot.value["id_resto"],
        nama_resto = snapshot.value["nama_resto"],
        gambar_resto = snapshot.value["gambar_resto"],
        alamat = snapshot.value["alamat"],
        no_telepon = snapshot.value["no_telepon"],
        jam_buka = snapshot.value["jam_buka"],
        genre_resto = snapshot.value["genre_resto"].cast<String>(),
        rating = snapshot.value["rating"].toString(),
        status = snapshot.value["status"],
        menu =
            ((snapshot.value["menu"]).map((e) => e.values.toString()).toList())
                .cast<String>();
  toJson() {
    return {
      "id_resto": id_resto,
      "nama_resto": nama_resto,
      "gambar_resto": gambar_resto,
      "alamat": alamat,
      "no_telepon": no_telepon,
      "jam_buka": jam_buka,
      "genre_resto": genre_resto,
      "rating": rating,
      "status": status,
      "menu": menu,
    };
  }
}

class Menu {
  String nama_makanan;
  int harga_makanan;
  bool stok;

  Menu({this.nama_makanan, this.harga_makanan, this.stok});

  Menu.fromSnapshot(DataSnapshot snapshot)
      : nama_makanan = snapshot.value["nama_makanan"],
        harga_makanan = snapshot.value["harga_makanan"],
        stok = snapshot.value["stok"];
  toJson() {
    return {
      "nama_makanan": nama_makanan,
      "harga_makanan": harga_makanan,
      "stok": stok,
    };
  }
}
