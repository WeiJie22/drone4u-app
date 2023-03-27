import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class D4uCarouselImageList extends StatelessWidget {
  D4uCarouselImageList({
    Key? key,
    required carouselImageList,
  }) : super(key: key);

  List<Widget>? carouselImageList;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: MediaQuery.of(context).size.width,
      initialPage: 0,
      height: 250,
      indicatorColor: d4uSecondaryColor,
      indicatorBackgroundColor: d4uGray,
      autoPlayInterval: 4000,
      isLoop: true,
      children: [
        Image.asset(
          'assets/mainPageImage.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/d4uDrone_white.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/d4uDrone_road.jpg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
