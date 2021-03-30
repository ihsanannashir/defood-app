<<<<<<< HEAD
import 'package:defood/screens/login.dart';
import 'package:defood/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
=======
import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raion Kelompok 5',
      // home: Scaffold(
      //   appBar: AppBar(title: const Text(_title)),
      //   body: MyStatelessWidget(),
      // )
>>>>>>> d2824b02de0591ca5e0070d2b0e82a21f1722443
      home: SplashScreen(),
    );
  }
}
