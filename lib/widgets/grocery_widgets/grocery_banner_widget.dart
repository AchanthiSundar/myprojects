import 'package:flutter/material.dart';

class GroceryBannerWidget extends StatelessWidget {
  const GroceryBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/grocery_images/grocery_banner.jpeg"),
            fit: BoxFit.cover
              )
        ),
    );
  }
}
