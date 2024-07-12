import 'package:ecomerce_app/data/product_data.dart';
import 'package:ecomerce_app/detail/widgets/detail_image_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_appbar.dart';

class MyDetailScreen extends StatefulWidget {
  final Product all;
  const MyDetailScreen({super.key, required this.all});

  @override
  State<MyDetailScreen> createState() => _MyDetailScreenState();
}

class _MyDetailScreenState extends State<MyDetailScreen> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
//for detail screen appbar
            DetailAppbar(),
            DetailImageSlider(
                onChange: (index) {
                  setState(() {
                    currentSlide = index;
                  });
                },
                image: widget.all.image),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: currentSlide == index ? 15 : 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentSlide == index
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(color: Colors.black))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
