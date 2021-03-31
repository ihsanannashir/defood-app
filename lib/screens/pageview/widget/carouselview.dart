import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselView();
  }
}

class _CarouselView extends State<CarouselView> {
  static final List<String> imgSlider = [
    'food1.png',
    'food2.png',
    'food3.png',
    'food4.png',
    'food5.png',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        color: Colors.transparent,
        child: Image(
          image: AssetImage('assets/images/${fileImage}'),
          width: 1000,
          fit: BoxFit.fill,
        ),
      );
    }).toList(),
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: false,
      aspectRatio: 2.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          autoPlayImage,
        ],
      ),
    );
  }
}
