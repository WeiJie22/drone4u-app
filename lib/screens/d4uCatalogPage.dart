import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';

class D4uCatalogPage extends StatefulWidget {
  D4uCatalogPage({Key? key}) : super(key: key);

  @override
  State<D4uCatalogPage> createState() => _D4uCatalogPageState();
}

class _D4uCatalogPageState extends State<D4uCatalogPage> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      showSearchBar: true,
      appBarTitle: "All Services",
      onFilterIconPressed: () {
        Navigator.pushNamed(context, RouteName.catalogFilterPage);
      },
      body: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => D4uProductCard(
          sellerName: 'roger',
          productName: 'catan',
          originalPrice: 100,
          discountPrice: 80,
          isDiscount: true,
          reviewCount: '(20)',
          imagePath: 'assets/mainPageImage.jpg',
          productRating: 4.5,
          showLabel: true,
          labelText: '-20%',
        ),
      ),
    );
  }
}
