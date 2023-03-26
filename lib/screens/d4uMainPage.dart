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
    return Column(
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
    );
  }
}
