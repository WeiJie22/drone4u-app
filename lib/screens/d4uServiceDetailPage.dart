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
        children: [
          D4uCarouselImageList(
            carouselImageList: carouselImageConstant,
          ),
        ],
      ),
    );
  }
}
