import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/screens/d4u_catalog_page.dart';
import 'package:drone4u/screens/d4u_favourite_page.dart';
import 'package:drone4u/screens/d4u_main_page.dart';
import 'package:drone4u/screens/d4u_my_profile_page.dart';
import 'package:drone4u/screens/d4u_orders_page.dart';
import 'package:flutter/material.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key, this.selectedIndex});

  final int? selectedIndex;

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  double expandedHeight = 160;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  List<Widget> pages = <Widget>[
    const D4uMainPage(),
    const D4uCatalogPage(),
    const D4uOrdersPage(),
    const D4uFavouritePage(),
    const D4uMyProfilePage(),
  ];

  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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
