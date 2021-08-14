import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class Page1 extends StatefulWidget {
  Page1(List<String> imgList);


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
              child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    height: height,
                  )),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}
