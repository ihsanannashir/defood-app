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
      home: SplashScreen(),
    );
  }
}
