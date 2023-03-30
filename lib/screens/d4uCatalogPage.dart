import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';

class D4uCatalogPageArguments {
  final String? title;

  D4uCatalogPageArguments({this.title});
}

class D4uCatalogPage extends StatefulWidget {
  const D4uCatalogPage({
    Key? key,
    this.arg,
  }) : super(key: key);

  final D4uCatalogPageArguments? arg;

  @override
  State<D4uCatalogPage> createState() => _D4uCatalogPageState();
}

class _D4uCatalogPageState extends State<D4uCatalogPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return D4uScaffold(
      pinAppBar: true,
      forceElevated: true,
      showSearchBar: true,
      appBarElevation: 0.5,
      appBarTitle: widget.arg?.title ?? 'Catalog',
      onFilterIconPressed: () {
        Navigator.pushNamed(
          context,
          RouteName.catalogFilterPage,
        );
      },
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: List.generate(
            10,
            (index) => D4uProductCard(
              sellerName: 'roger',
              productName: 'catan',
              originalPrice: 100,
              discountPrice: 80,
              isDiscount: true,
              reviewCount: '(20)',
              imageWidth: 200,
              imageHeight: 170,
              width: width / 2 - 18,
              imagePath: 'assets/mainPageImage.jpg',
              productRating: 4.5,
              showLabel: true,
              labelText: '-20%',
            ),
          ),
        ),
      ),
    );
  }
}
