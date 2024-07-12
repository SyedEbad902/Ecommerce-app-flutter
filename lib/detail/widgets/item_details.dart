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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\$${all.price}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 156, 7)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            all.rate.toString(),
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
