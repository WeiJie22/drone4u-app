import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/home_page_contant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  String _searchValue = '';

  List dataList = productMockDataList;

  _onSearchChanged(String value) {
    setState(() {
      _searchValue = value;
      dataList = productMockDataList
          .where((element) =>
              element.name!.toLowerCase().contains(_searchValue.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: d4uBackground,
        body: CustomScrollView(
          slivers: [
            D4uSliverAppBar(
              showBackButton: false,
              pinAppBar: true,
              appBarTitle: 'Catalog',
              forceElevated: true,
              appBarElevation: 0.5,
            ),
            SliverPersistentHeader(
              delegate: MyHeaderDelegate(
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteName.catalogFilterPage,
                ),
                onChanged: (value) {
                  _onSearchChanged(value);
                },
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        padding: D4uPadding.zero,
                        shrinkWrap: true,
                        itemCount: dataList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.35,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (context, idx) {
                          Product product = dataList[idx];

                          return D4uProductCard(
                            sellerName: product.sellerName,
                            productName: product.name,
                            originalPrice: product.originalPrice,
                            discountPrice: product.discountPrice,
                            isDiscount: true,
                            reviewCount: product.reviewCount.toString(),
                            imageWidth: 200,
                            imageHeight: 170,
                            width: width / 2 - 18,
                            imagePath: product.imagePath ?? '',
                            productRating: product.productRating ?? 0,
                            showLabel: true,
                            labelText: '-20%',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  MyHeaderDelegate({
    this.onTap,
    this.onChanged,
  });

  VoidCallback? onTap;
  Function(String)? onChanged;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: d4uBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: D4uTextField(
              name: 'search',
              placeHolder: 'Search',
              onChanged: (value) {
                onChanged!(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.sort),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
