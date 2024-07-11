import 'package:flutter/material.dart';

class CustomImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;
  const CustomImageSlider({
    super.key,
    required this.onChange,
    required this.currentSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              
              children: [
                Image.asset(
                  "assets/images/slider.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slider3.png",
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
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
          ),
        )
      ],
    );
  }
}
