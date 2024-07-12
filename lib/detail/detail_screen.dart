import 'package:ecomerce_app/data/product_data.dart';
import 'package:ecomerce_app/detail/widgets/detail_image_slider.dart';
import 'package:ecomerce_app/detail/widgets/item_details.dart';
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
            const DetailAppbar(),
            DetailImageSlider(
                onChange: (index) {
                  setState(() {
                    currentSlide = index;
                  });
                },
                image: widget.all.image),
            SliderIndex(currentSlides: currentSlide),
            // details
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetails(all: widget.all),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
