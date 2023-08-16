import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarouselBottom extends StatelessWidget {
  ImageCarouselBottom({super.key});

  final List<String> imageUrls = [
    'images/image_carousel_2/image_carousel_1.jpeg',
    'images/image_carousel_2/image_carousel_2.jpeg',
    'images/image_carousel_2/image_carousel_3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 90.0,
        // enlargeCenterPage: true,
        aspectRatio: 16 / 9, // Set aspect ratio as needed
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        // Adjust the height as needed
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
