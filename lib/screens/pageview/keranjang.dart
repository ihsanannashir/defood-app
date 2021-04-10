import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defood/screens/models/checkout.dart';
import 'package:defood/screens/models/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final searchController = TextEditingController();
  Checkout _cartItems;
  List<Orders> orders = [];
  var uuid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference cart = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('cart');

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    print(_cartItems.cart[1].id_cart);
    return Scaffold(
      backgroundColor: Color(0xFFA53C27),
      body: Text("Hi"),
    );
  }

  Widget menuItems(nama, harga, quantity, idResto) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.transparent,
            child: ClipPath(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFBD452C).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
          child: Text(nama,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(harga.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              )),
        ),
      ],
    );
  }
}
