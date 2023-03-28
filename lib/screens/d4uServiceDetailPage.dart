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
    return D4uScaffold(
      pinAppBar: true,
      showBackButton: true,
      appBarTitle: 'Detail Product',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          D4uServiceDetail(
            productName: 'Drone 1',
            price: 350,
            rating: 4.6,
            review: 86,
          ),
        ],
      ),
    );
  }
}
