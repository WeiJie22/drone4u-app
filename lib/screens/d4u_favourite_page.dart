import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/favourite_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class D4uFavouritePage extends StatefulWidget {
  const D4uFavouritePage({super.key});

  @override
  State<D4uFavouritePage> createState() => _D4uFavouritePageState();
}

class _D4uFavouritePageState extends State<D4uFavouritePage> {
  List<FormBuilderChipOption> options = categories
      .map<FormBuilderChipOption>(
        (e) => FormBuilderChipOption(value: e),
      )
      .toList();

  int selectedIndex = 0;

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
        body: Column(
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
                itemCount: 15,
                shrinkWrap: true,
                itemBuilder: (context, index) => D4uHorizontalProductCard(
                  image: 'assets/d4uDrone_road.jpg',
                  seller: 'Drone4U',
                  serviceName: 'Drone Photography',
                  price: 100,
                  rating: 3,
                  categories: ['Photography', 'Drone'],
                  cardHeight: 115,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
