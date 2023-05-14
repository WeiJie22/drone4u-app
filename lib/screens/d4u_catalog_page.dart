import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/home_page_contant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/providers/products_provider.dart';
import 'package:drone4u/screens/d4u_service_detail_page.dart';
import 'package:drone4u/services/auth.dart';
import 'package:drone4u/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: d4uBackground,
        body: ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          builder: (context, child) {
            ProductProvider model = Provider.of<ProductProvider>(context);
            List<Product> products = model.products ?? [];

            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: () async {
                if (!model.canLoadMore) {
                  _refreshController.loadNoData();
                } else {
                  await model.loadMore();
                  _refreshController.loadComplete();
                }
              },
              onRefresh: () async {
                await model.initData();
                _refreshController.refreshCompleted();
                _refreshController.loadComplete();
              },
              child: CustomScrollView(
                slivers: [
                  D4uSliverAppBar(
                    showBackButton: false,
                    pinAppBar: false,
                    appBarTitle: 'Shops',
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
                        debouncer.run(() {
                          model.onSearchChanged(value);
                          _refreshController.loadComplete();
                        });
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
                              itemCount: products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.35,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              itemBuilder: (context, idx) {
                                Product product = products[idx];

                                return D4uProductCard(
                                  sellerName: product.sellerName ?? '',
                                  productName: product.name,
                                  price: product.price,
                                  discountPrice: product.discountPrice,
                                  isDiscount: product.isDiscount ?? false,
                                  reviewCount: product.reviewCount.toString(),
                                  imageWidth: 200,
                                  imageHeight: 170,
                                  imagePath: product.images?[0] ?? '',
                                  width: width / 2 - 18,
                                  productRating: product.productRating ?? 0,
                                  onPressedCircularIcon: () async {
                                    print('Favourite');
                                    model.setFavourite(product.id!);
                                  },
                                  onPressedProduct: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.serviceDetailPage,
                                      arguments: D4uServiceDetailPageArgs(
                                        product: product,
                                      ),
                                    );
                                  },
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
            );
          },
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
