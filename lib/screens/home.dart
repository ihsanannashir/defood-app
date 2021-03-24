import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      appBar: AppBar(
        title: Text('INI BAR'),
      ),
      body: SafeArea(
        child: Text('INI HOME'),
      ),
    );
  }
}