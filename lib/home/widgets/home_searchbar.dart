import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(children: [
        Container(
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
        SizedBox(
          width: 5,
        ),
        Container(
          height: 35,
          width: 1.5,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ),
      ]),
    );
  }
}
