import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uOrderDetailsPageArgs {
  D4uOrderDetailsPageArgs({this.productName});

  String? productName;
}

class D4uOrderDetailsPage extends StatelessWidget {
  const D4uOrderDetailsPage({this.args, super.key});

  final D4uOrderDetailsPageArgs? args;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      appBarTitle: "Order Details",
      bottomNavigationBarWidget: D4uDuoButton(
        padding: D4uPadding.a16,
        secondaryText: 'Cancel Order',
        primaryText: 'Accept Order',
        secondaryCallback: () => print('Cancel Order'),
        primaryCallback: () => print('Accept Order'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          D4uText(
            padding: D4uPadding.containerCenter,
            text: args?.productName ?? 'Product A',
            textStyle: D4uTextStyle.h1,
          ),
          D4uHorizontalProductCard(
            hideCloseButton: true,
            image: 'assets/d4uDrone_road.jpg',
            seller: 'Drone4U',
            serviceName: 'Drone Photography',
            price: 100,
            rating: 3,
            categories: ['Photography', 'Drone'],
            cardHeight: 115,
          ),
          D4uText(
            padding: D4uPadding.containerCenter,
            text: 'Order Information',
            textStyle: D4uTextStyle.h2,
          ),
          D4uInfoList(
            showDottedLine: true,
            padding: D4uPadding.containerCenter4,
            leftTextStyle: D4uTextStyle.labelText,
            rightTextStyle: D4uTextStyle.labelTextBold,
            leftTextList: [
              'Order ID',
              'Username',
              'Order Date',
              'Order Status',
              "Service start date",
              "Service end date",
              'Address',
              'Order Amount',
            ],
            rightTextList: [
              '123456789',
              'Tan Ah Kow',
              '2021-01-01',
              'Completed',
              '2021-01-02',
              '2021-01-02',
              'K-19-B, Tiara Damansara, Jalan 17/1, 46400 Petaling Jaya, Selangor',
              'RM100.00',
            ],
          )
        ],
      ),
    );
  }
}
