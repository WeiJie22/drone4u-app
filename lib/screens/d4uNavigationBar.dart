import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/homePageContant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4uMainPage.dart';
import 'package:drone4u/utils/scrollUtils.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key});

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar>
    with TickerProviderStateMixin {
  double expandedHeight = 160;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      pinAppBar: true,
      showExpandedAppBar: true,
      expandedHeight: expandedHeight,
      appBarTitle: 'Drone4U',
      bottomNavigationBarWidget: BottomNavigationBar(
        backgroundColor: d4uSecondaryColor,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(color: d4uPrimaryColor, fontSize: 16),
        unselectedLabelStyle:
            const TextStyle(color: d4uPrimaryColor, fontSize: 16),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: d4uPrimaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: d4uPrimaryColor,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: d4uPrimaryColor,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
              color: d4uPrimaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: const D4uMainPage(),
    );
  }
}
