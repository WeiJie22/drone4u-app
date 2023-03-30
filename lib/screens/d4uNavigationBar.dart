import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/screens/d4uCatalogPage.dart';
import 'package:drone4u/screens/d4uFavouritePage.dart';
import 'package:drone4u/screens/d4uMainPage.dart';
import 'package:drone4u/screens/d4uOrdersPage.dart';
import 'package:flutter/material.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key});

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  double expandedHeight = 160;

  List<Widget> pages = <Widget>[
    D4uMainPage(),
    D4uCatalogPage(),
    D4uOrdersPage(),
    D4uFavouritePage(),
    D4uMainPage(),
  ];

  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: d4uSecondaryColor,
        showUnselectedLabels: true,
        selectedItemColor: d4uPrimaryColor,
        unselectedItemColor: d4uGray,
        selectedIconTheme: const IconThemeData(color: d4uPrimaryColor),
        unselectedIconTheme: const IconThemeData(color: d4uGray),
        selectedLabelStyle: const TextStyle(fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: bottomIcon(Icons.home),
            icon: bottomIcon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: bottomIcon(
              Icons.shopping_cart,
            ),
            icon: bottomIcon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            activeIcon: bottomIcon(
              Icons.shopping_bag,
            ),
            icon: bottomIcon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            activeIcon: bottomIcon(
              Icons.favorite,
            ),
            icon: bottomIcon(
              Icons.favorite_outline,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: bottomIcon(
              Icons.manage_accounts,
            ),
            icon: bottomIcon(
              Icons.manage_accounts_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Padding bottomIcon(icon) {
    return Padding(
      padding: D4uPadding.a2,
      child: Icon(icon),
    );
  }
}
