import 'package:ecomerce_app/cart/total_screen.dart';
import 'package:ecomerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';

import '../nav_bar_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartList = provider.cart;
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQty(index)
                : provider.decrementQty(index);
          });
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
      bottomSheet: const TotalScreen(),
      // backgroundColor:  Color.fromARGB(255, 255, 156, 7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyNavBar()));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartList[index];
                      return Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(cartItem.image),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(cartItem.title,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 5),
                                        Text(cartItem.category,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade400)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("\$${cartItem.price}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 20,
                              right: 15,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartList.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                        color: Colors.red,
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 156, 7),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        productQuantity(Icons.add, index),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          cartItem.quantity.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        productQuantity(Icons.remove, index),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
