import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;

  const DetailImageSlider(
      {super.key, required this.onChange, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
          onPageChanged: onChange,
          itemBuilder: (context, index) { 
            return Hero(tag: image, child: Image.asset(image));
          }),
    );
  }
}

class SliderIndex extends StatelessWidget {
  const SliderIndex({
    super.key,
    required this.currentSlides,
  });

  final int currentSlides;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: currentSlides == index ? 15 : 8,
            height: 8,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    currentSlides == index ? Colors.black : Colors.transparent,
                border: Border.all(color: Colors.black))),
      ),
    );
  }
}
