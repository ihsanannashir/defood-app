import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
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
                    child:
                        Text("Ini page akun", style: TextStyle(fontSize: 30)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
