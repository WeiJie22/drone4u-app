import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key});

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      expandedHeight: 160,
      flexibleSpaceWidget: FlexibleSpaceBar(
        title: const Text('Drone4U'),
        titlePadding: D4uPadding.a24,
        background: Image.asset(
          'assets/mainPageImage.jpg',
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBarWidget: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              D4uProductCard(
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
                isFavourite: _isFavourite,
                onPressedFavorite: () {
                  setState(() {
                    _isFavourite = !_isFavourite;
                  });
                },
              ),
              D4uProductCard(
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
                isFavourite: false,
                onPressedFavorite: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
