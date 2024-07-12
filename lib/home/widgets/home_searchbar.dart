import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(children: [
        SizedBox(
          width: 290,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: 'Search Store',
                hoverColor: Colors.grey,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 25,
                )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          height: 35,
          width: 1.5,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ),
      ]),
    );
  }
}
