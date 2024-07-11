import 'package:ecomerce_app/data/product_data.dart';
import 'package:ecomerce_app/home/widgets/home_shoping_items.dart';
import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_image_slider.dart';
import 'widgets/home_searchbar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 15,
              ),
              //for categories
              Categories(),
              //for special for you
              Row(
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: all.length,
                  itemBuilder: (context, index) {
                    return ShopingItems(all: all[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
