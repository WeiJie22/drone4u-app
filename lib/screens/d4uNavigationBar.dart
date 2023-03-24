import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/homePageContant.dart';
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
  late ScrollController _scrollController;

  double expandedHeight = 160;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      centerAppBarTitle: true,
      pinAppBar: true,
      expandedHeight: expandedHeight,
      appBarElevation: 0,
      scrollController: _scrollController,
      flexibleSpaceWidget: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: D4uText(
          text: 'Drone4U',
        ),
        titlePadding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: horizontalTitlePadding(_scrollController, expandedHeight),
        ),
        background: Image.asset(
          'assets/d4uDrone_white.jpg',
          fit: BoxFit.cover,
        ),
      ),
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
              Icons.shopping_bag,
              color: d4uPrimaryColor,
            ),
            label: 'Orders',
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
