import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../model/category_item.dart';

class ExploreSmallItems extends StatelessWidget {
  const ExploreSmallItems({super.key, required this.item});

  final ExploreByCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return TouchRippleEffect(
      rippleColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#f6edf9"),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [

                    const SizedBox(
                      height: 5,
                    ),
                     Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          item.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#49067f")),
                        ),
                      ),
                    
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child:  Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.contain,
                            height:60,

                          ),
                        ),
                      ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
