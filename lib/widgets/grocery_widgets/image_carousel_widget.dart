import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({super.key});

  final List<String> imageUrls = [
    'images/image_carousel/image_carousel_1.jpeg',
    'images/image_carousel/image_carousel_2.jpeg',
    'images/image_carousel/image_carousel_3.jpeg',
    'images/image_carousel/image_carousel_4.jpeg',
    'images/image_carousel/image_carousel_5.jpeg',
    'images/image_carousel/image_carousel_6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.0,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
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
