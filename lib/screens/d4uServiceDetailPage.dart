import 'package:drone4u/components/d4uServiceDetail.dart';
import 'package:drone4u/constant/carouselImageConstant.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/reviewConstant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uServiceDetailPage extends StatefulWidget {
  const D4uServiceDetailPage({super.key});

  @override
  State<D4uServiceDetailPage> createState() => _D4uServiceDetailPageState();
}

class _D4uServiceDetailPageState extends State<D4uServiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            D4uSliverAppBar(
              appBarTitle: 'Service 1',
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
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
              D4uReviewTitle(
                review: 86,
                rating: 4.6,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reviewList.length,
                  itemBuilder: (context, index) {
                    return reviewList[index];
                  },
                ),
              ),
              D4uBottomSheet(
                price: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
