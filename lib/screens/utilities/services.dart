import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/models/cart_items.dart';
import 'package:defood/screens/models/checkout.dart';
import 'package:defood/screens/models/orders.dart';
import 'package:defood/screens/models/resto.dart';

class DefoodServices {
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
  //User cart
  void addToCart({String userId, CartItems cartItem}) {
    _db.collection('users').doc(userId).update({
      'cart': FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItems cartItem}) {
    _db.collection('users').doc(userId).update({
      'cart': FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

  Future<Checkout> getUserById(String id) =>
      _db.collection('users').doc(id).get().then((doc) {
        return Checkout.fromSnapshot(doc);
      });

  //Orders
  void createOrder(
      {String id,
      String uuid,
      String status,
      List<CartItems> cart,
      int total}) {
    List<Map> convertedCart = [];
    List<String> restaurantIds = [];

    for (CartItems items in cart) {
      convertedCart.add(items.toMap());
      restaurantIds.add(items.id_resto);
    }

    _db.collection('orders').doc(id).set({
      "id": id,
      "uuid": uuid,
      "id_resto": restaurantIds,
      "cart": convertedCart,
      "total": total,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "status": status
    });
  }

  Future<List<Orders>> getUserOrders({String userId}) async => _db
          .collection('orders')
          .where('uuid', isEqualTo: userId)
          .get()
          .then((result) {
        List<Orders> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(Orders.fromSnapshot(order));
        }
        return orders;
      });
}
