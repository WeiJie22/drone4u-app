import 'package:drone4u/constant/home_page_contant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/d4u_centered_loading.dart';
import '../components/d4u_index.dart';
import '../models/product.dart';
import '../providers/products_provider.dart';

class D4uMainPage extends StatefulWidget {
  const D4uMainPage({super.key});

  @override
  State<D4uMainPage> createState() => _D4uMainPageState();
}

class _D4uMainPageState extends State<D4uMainPage> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      pinAppBar: true,
      showExpandedAppBar: true,
      appBarTitle: 'Drone4U',
      body: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        builder: (context, child) {
          ProductProvider model = Provider.of<ProductProvider>(context);

          List<Product> products = model.products ?? [];

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          List<Product> productsList = products.take(4).toList();

          

          return Column(
            children: [
              D4uHorizontalSection(
                sectionTitle: 'Sales',
                sectionSubtitle: "Summer sales",
                servicesList: productsList,
                viewAllOnTap: () => _navigate('Sales 1'),
              ),
              D4uHorizontalSection(
                sectionTitle: 'Sales',
                sectionSubtitle: "Summer sales",
                servicesList: products.take(4).toList(),
                viewAllOnTap: () => _navigate('Sales 2'),
              ),
              D4uHorizontalSection(
                sectionTitle: 'Sales',
                sectionSubtitle: "Summer sales",
                servicesList: products.take(4).toList(),
                viewAllOnTap: () => _navigate('Sales 3'),
              ),
            ],
          );
        },
      ),
    );
  }

  _navigate(String title) {
    Navigator.pushNamed(
      context,
      RouteName.navigationBar,
      arguments: 1,
    );
  }
}
