import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/homePageContant.dart';
import 'package:drone4u/constant/routes.dart';
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
          D4uHorizontalSection(
            sectionTitle: 'Sales',
            sectionSubtitle: 'Best deals',
            viewAllOnTap: () {
              Navigator.pushNamed(context, RouteName.catalogPage);
            },
            servicesList: salesProductCards,
          ),
          D4uHorizontalSection(
            sectionTitle: 'Sales',
            sectionSubtitle: 'Best deals',
            viewAllOnTap: () {},
            servicesList: salesProductCards,
          ),
          D4uHorizontalSection(
            sectionTitle: 'Sales',
            sectionSubtitle: 'Best deals',
            viewAllOnTap: () {},
            servicesList: salesProductCards,
          )
        ],
      ),
    );
  }
}
