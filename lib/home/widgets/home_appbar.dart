import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 221, 220, 220)),
            onPressed: () {},
            icon: Icon(
              Icons.grid_view_rounded,
              size: 25,
            )),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 221, 220, 220)),
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 25,
            )),
      ],
    );
  }
}
