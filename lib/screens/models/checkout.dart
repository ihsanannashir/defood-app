import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/models/cart_items.dart';

class Checkout {
  static const UUID = "uuid";
  static const NAME = "name";
  static const CART = "cart";

  String _uuid;
  String _name;
  int _priceSum = 0;
  int _quantitySum = 0;
  // DateTime _delivery;

  String get uuid => _uuid;
  String get name => _name;

  List<CartItems> cart;
  int totalPrice;

  Checkout.fromSnapshot(DocumentSnapshot snapshot) {
    _uuid = snapshot.data()[UUID];
    _name = snapshot.data()[NAME];
    cart = convertCartItems(snapshot.data()[CART]) ?? [];
    totalPrice = snapshot.data()[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data()[CART]);
  }
  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem['harga_makanan'] * cartItem['quantity'];
    }
    int total = _priceSum;
    return total;
  }

  List<CartItems> convertCartItems(List cart) {
    List<CartItems> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItems.fromMap(cartItem));
    }
    print(convertedCart);
    return convertedCart;
  }
}
