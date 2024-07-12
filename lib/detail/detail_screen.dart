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
  int currentColor = 0;
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
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetails(all: widget.all),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Colors",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: List.generate(
                        widget.all.colors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 300),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentColor == index
                                      ? Colors.white
                                      : widget.all.colors[index],
                                  border: currentColor == index
                                      ? Border.all(
                                          color: widget.all.colors[index])
                                      : null,
                                ),
                                padding: currentColor == index
                                    ? const EdgeInsets.all(3)
                                    : null,
                                margin: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: widget.all.colors[index],
                                      shape: BoxShape.circle),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
