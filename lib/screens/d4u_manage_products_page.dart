import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/providers/manage_products_provider.dart';
import 'package:drone4u/screens/d4u_edit_product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class D4uManageProductsPage extends StatefulWidget {
  const D4uManageProductsPage({super.key});

  @override
  State<D4uManageProductsPage> createState() => _D4uManageProductsPageState();
}

class _D4uManageProductsPageState extends State<D4uManageProductsPage> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      pinAppBar: true,
      showBackButton: true,
      appBarTitle: 'Manage Products',
      body: ChangeNotifierProvider(
        create: (context) => ManageProductsProvider(),
        builder: (context, child) {
          ManageProductsProvider model =
              Provider.of<ManageProductsProvider>(context);
          List<Product> products = model.products ?? [];

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          if (model.products!.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: Text("No Products found"),
              ),
            );
          }

          return SingleChildScrollView(
            child: ListView.builder(
              padding: D4uPadding.zero,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];

                return Padding(
                  padding: D4uPadding.v8,
                  child: D4uHorizontalProductCard(
                    onCardTap: () => Navigator.pushNamed(
                      context,
                      RouteName.editProductPage,
                      arguments: D4uEditProductPageArgs(
                        productId: product.id,
                      ),
                    ),
                    isCard: false,
                    hideCloseButton: true,
                    image: product.images![0],
                    seller: product.sellerName,
                    serviceName: product.name,
                    price: product.price,
                    categories: product.categories,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
