import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/grocery_item.dart';

class GroceryItemCardWidget extends StatelessWidget {
  const GroceryItemCardWidget({Key? key, required this.item}) : super(key: key);
  final GroceryItem item;

  final double width = 154;
  final double height = 200;
  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 3,
        shadowColor: HexColor("#49067f"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 3),
                child: Text(
                  item.offer + ' Off',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: imageWidget(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7C7C7C)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Text("₹" + item.price,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      const Spacer(),
                      addWidget()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Image.asset(
      item.imagePath,
      height: 80,
      width: 80,
    );
  }

  Widget addWidget() {
    return Container(
      height: 30,
      width: 50,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1, color: HexColor("#ed3d68")))),
      child: Center(
          child: Text(
        "Add",
        style: TextStyle(color: HexColor("#ed3d68")),
      )),
    );
  }
}
