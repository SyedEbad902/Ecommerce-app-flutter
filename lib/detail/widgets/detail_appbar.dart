import 'package:flutter/material.dart';

import '../../data/product_data.dart';
import '../../provider/favorite_provider.dart';

class DetailAppbar extends StatelessWidget {
  final Product all;
  const DetailAppbar({super.key, required this.all});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              )),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                size: 20,
              )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                provider.isFavorite(all);
              },
              icon: Icon(
                provider.isExist(all) ? Icons.favorite : Icons.favorite_outline,
                color: Colors.black,
                size: 20,
              )),
        ],
      ),
    );
  }
}
