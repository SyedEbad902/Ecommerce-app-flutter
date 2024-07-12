import 'package:ecomerce_app/data/product_data.dart';
import 'package:flutter/material.dart';

import '../../detail/detail_screen.dart';

class ShopingItems extends StatelessWidget {
  final Product all;
  const ShopingItems({super.key, required this.all});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyDetailScreen(all: all)));
      },
      child: Stack(
        children: [
          Container(
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 242, 240, 240)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    all.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    all.title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "price ${all.price}",
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
