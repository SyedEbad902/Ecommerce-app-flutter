import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_searchbar.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              //for appbar
              CustomAppBar(),
              SizedBox(
                height: 15,
              ),
              //for searchbar
              CustomSearchBar(),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        allowImplicitScrolling: true,
                        physics: ClampingScrollPhysics(),
                        children: [
                          Image.asset(
                            "assets/images/slider.jpg",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/images/image1.png",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/images/slider3.png",
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
