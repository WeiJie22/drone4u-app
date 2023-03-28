import 'dart:math';

import 'package:drone4u/components/d4uServiceDetail.dart';
import 'package:drone4u/constant/carouselImageConstant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uServiceDetailPage extends StatefulWidget {
  const D4uServiceDetailPage({super.key});

  @override
  State<D4uServiceDetailPage> createState() => _D4uServiceDetailPageState();
}

class _D4uServiceDetailPageState extends State<D4uServiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            D4uSliverAppBar(
              appBarTitle: 'Service 1',
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              D4uCarouselImageList(carouselImageList: carouselImageConstant),
              D4uServiceDetail(
                productName: 'Drone 1',
                price: 450,
                sellerName: 'Shop Larson Electronic',
                sellerImage: 'assets/d4uDrone_road.jpg',
                productDescription:
                    'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. \n\n The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
