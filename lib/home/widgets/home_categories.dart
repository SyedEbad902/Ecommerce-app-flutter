import 'package:ecomerce_app/data/categories_data.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(categoriesList[index].image),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                )));
  }
}
