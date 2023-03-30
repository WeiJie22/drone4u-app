import 'package:drone4u/constant/homePageContant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4uCatalogPage.dart';
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
            sectionTitle: 'Sales',
            sectionSubtitle: "Summer sales",
            servicesList: productMockDataList,
            viewAllOnTap: () => _navigate('Sales 1'),
          ),
          D4uHorizontalSection(
            sectionTitle: 'Sales',
            sectionSubtitle: "Summer sales",
            servicesList: productMockDataList,
            viewAllOnTap: () => _navigate('Sales 2'),
          ),
          D4uHorizontalSection(
            sectionTitle: 'Sales',
            sectionSubtitle: "Summer sales",
            servicesList: productMockDataList,
            viewAllOnTap: () => _navigate('Sales 3'),
          ),
        ],
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
