import 'package:ecomerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
      final provider = FavoriteProvider.of(context);
    final cartList = provider.favorite;
  return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Favorite",style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
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
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
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
                                
                                  ],
                            ))
                      ],
                    );
                  }))
      ],),
    );
    
  }
}