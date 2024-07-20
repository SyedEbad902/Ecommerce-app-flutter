import 'package:ecomerce_app/data/product_data.dart';
import 'package:ecomerce_app/home/widgets/home_shoping_items.dart';
import 'package:flutter/material.dart';
import '../data/categories_data.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_image_slider.dart';
import 'widgets/home_searchbar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              //for appbar
              const CustomAppBar(),
              const SizedBox(
                height: 15,
              ),
              //for searchbar
              const CustomSearchBar(),
              const SizedBox(
                height: 15,
              ),
              CustomImageSlider(
                  onChange: (val) {
                    setState(() {
                      currentSlider = val;
                    });
                  },
                  currentSlide: currentSlider),
              const SizedBox(
                height: 15,
              ),
              //for categories
              // Categories(),
              SizedBox(
                  height: 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedIndex == index
                                  ? Colors.blue[200]
                                  : Colors.transparent),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            categoriesList[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                categoriesList[index].title,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              //for special for you
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  )
                ],
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: selectedCategory[selectedIndex].length,
                  itemBuilder: (context, index) {
                    return ShopingItems(
                        all: selectedCategory[selectedIndex][index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
