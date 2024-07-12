import 'package:flutter/material.dart';

class DetailAppbar extends StatelessWidget {
  const DetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              )),
          Spacer(),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                size: 20,
              )),
          SizedBox(
            width: 10,
          ),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 20,
              )),
        ],
      ),
    );
  }
}
