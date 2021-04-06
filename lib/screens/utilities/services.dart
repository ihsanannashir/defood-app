import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/models/orders.dart';

class Services {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Restaurant List
  Future<List<Resto>> getRestoByCat({String cat}) async => _db
      .collection('restoran')
      .where('genre_resto', arrayContainsAny: [cat])
      .get()
      .then((result) {
        List<Resto> restoList = [];
        for (DocumentSnapshot resto in result.docs) {
          restoList.add(Resto.fromSnapshot(resto));
        }
        return restoList;
      });
}
