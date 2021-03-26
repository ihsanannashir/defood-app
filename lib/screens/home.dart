import 'package:creatice/screens/onboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CreateICE"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text("This is a login page"),
                  TextButton(
                      onPressed: () {
                        navigateToOnboard(context);
                      },
                      child: Text("Onboard page"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future navigateToOnboard(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoard()));
  }
}
