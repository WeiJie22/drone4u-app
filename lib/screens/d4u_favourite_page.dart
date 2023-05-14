import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/favourite_constant.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class D4uFavouritePage extends StatefulWidget {
  const D4uFavouritePage({super.key});

  @override
  State<D4uFavouritePage> createState() => _D4uFavouritePageState();
}

class _D4uFavouritePageState extends State<D4uFavouritePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  List<FormBuilderChipOption> options = categories
      .map<FormBuilderChipOption>(
        (e) => FormBuilderChipOption(value: e),
      )
      .toList();

  int selectedIndex = 0;

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d4uBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          D4uSliverAppBar(
            appBarTitle: 'Favourite',
            showBackButton: false,
          ),
        ],
        body: ChangeNotifierProvider(
          create: (context) => ProductProvider(initFavourite: true),
          builder: (context, child) {
            ProductProvider model = Provider.of<ProductProvider>(context);

            List<Product> products = model.favouriteProducts ?? [];
            products = products.reversed.toList();

            if (model.isLoading) {
              return const D4uCenteredLoading();
            }

            if (products.isEmpty) {
              return const Center(
                child: Text('No favourite products'),
              );
            }

            return SmartRefresher(
              primary: false,
              controller: _refreshController,
              onRefresh: () async {
                await model.getFavouriteProducts();
                _refreshController.refreshCompleted();
              },
              child: Column(
                children: [
                  D4uChipModel(
                    options: categories,
                    onChange: (index) {
                      print(categories[index]);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Product product = products[index];

                          return D4uHorizontalProductCard(
                            image: product.images?[0],
                            seller: product.sellerName,
                            serviceName: product.name,
                            price: product.price,
                            rating: 3,
                            categories: product.categories,
                            cardHeight: 115,
                            onCancelTap: () async {
                              model.removeFavourite(product.id!);
                            },
                          );
                        }),
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
