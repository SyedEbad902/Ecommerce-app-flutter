import 'package:flutter/material.dart';

import '../../data/product_data.dart';

class ItemDetails extends StatelessWidget {
  final Product all;
  const ItemDetails({super.key, required this.all});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          all.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${all.price}",
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 156, 7)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            all.rate.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      all.review,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "Seller: ",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              TextSpan(
                  text: all.seller,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ]))
          ],
        )
      ],
    );
  }
}
