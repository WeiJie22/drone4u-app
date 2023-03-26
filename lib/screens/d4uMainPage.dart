import 'package:drone4u/constant/homePageContant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

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
      body: Column(
        children: [
          D4uHorizontalSection(
              servicesList: salesProductCards,
              viewAllOnTap: () =>
                  Navigator.pushNamed(context, RouteName.catalogPage)),
          D4uHorizontalSection(servicesList: salesProductCards),
          D4uHorizontalSection(servicesList: salesProductCards),
        ],
      ),
    );
  }
}
