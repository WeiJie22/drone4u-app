import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/components/d4u_order_card.dart';
import 'package:drone4u/components/d4u_segmented_tab.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4u_order_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class D4uOrdersPage extends StatefulWidget {
  const D4uOrdersPage({super.key});

  @override
  State<D4uOrdersPage> createState() => _D4uOrdersPageState();
}

class _D4uOrdersPageState extends State<D4uOrdersPage> {
  List<String> options = [
    "Own Orders",
    "Orders for me",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d4uBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          D4uSliverAppBar(
            appBarTitle: 'Orders',
          )
        ],
        body: Column(
          children: [
            D4uSegmentedTab(
              options: options,
              onChange: (val) {
                print(val);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, int) => D4uOrderCard(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.orderDetailsPage,
                      arguments:
                          D4uOrderDetailsPageArgs(productName: 'Product A'),
                    );
                  },
                  leftTextList: [
                    "Order ID",
                    'User name',
                    "Service Start Date",
                    "Service End Date",
                  ],
                  rightTextList: [
                    '123456789',
                    "Jason Wang",
                    '12/12/2021',
                    '12/12/2021',
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
