import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../model/category_item.dart';

class ExploreItems extends StatelessWidget {
  const ExploreItems({super.key, required this.item});

  final ExploreByCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return TouchRippleEffect(
      rippleColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#f6edf9"),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      item.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#49067f")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
