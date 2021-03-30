import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final searchController = TextEditingController();

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                    child: Text("Ini page keranjang",
                        style: TextStyle(fontSize: 30)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
