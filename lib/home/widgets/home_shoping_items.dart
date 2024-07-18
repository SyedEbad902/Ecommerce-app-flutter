import 'package:ecomerce_app/data/product_data.dart';
import 'package:ecomerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

import '../../detail/detail_screen.dart';

class ShopingItems extends StatelessWidget {
  final Product all;
  const ShopingItems({super.key, required this.all});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyDetailScreen(all: all)));
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
                  child: Hero(
                    tag: all.image,
                    child: Image.asset(
                      all.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    all.title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
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
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 156, 7),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.isFavorite(all);
                  },
                  child: Icon(
                    provider.isExist(all)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.white,
                    
                    
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
