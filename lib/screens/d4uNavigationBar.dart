import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/homePageContant.dart';
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
      showBackButton: true,
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
