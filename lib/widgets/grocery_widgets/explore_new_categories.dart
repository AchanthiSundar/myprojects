import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class ExploreNewCategories extends StatelessWidget {
  ExploreNewCategories({super.key});

  final List<String> exploreNewCategory = [
    'images/grocery_explore_new_categories/kitchen_needs.jpeg',
    'images/grocery_explore_new_categories/pet_care.jpeg',
    'images/grocery_explore_new_categories/gift.jpeg',
    'images/grocery_explore_new_categories/make_up.jpeg',
    'images/grocery_explore_new_categories/party.jpeg',
    'images/grocery_explore_new_categories/fitness.jpeg',
    'images/grocery_explore_new_categories/organic.jpeg',
    'images/grocery_explore_new_categories/baby.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        height: 120,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          itemCount: exploreNewCategory.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return TouchRippleEffect(
              rippleColor: Colors.grey,
                onTap: () {}, child: Image.asset(exploreNewCategory[index]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 15,
            );
          },
        ),
      ),
    );
  }
}
