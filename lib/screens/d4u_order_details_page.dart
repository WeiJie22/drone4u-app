import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/models/order.dart';
import 'package:drone4u/providers/orders_provider.dart';
import 'package:drone4u/utils/date_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class D4uOrderDetailsPageArgs {
  D4uOrderDetailsPageArgs({
    this.orderId,
    this.isOrdersForMe = false,
  });

  String? orderId;
  bool? isOrdersForMe;
}

class D4uOrderDetailsPage extends StatelessWidget {
  D4uOrderDetailsPage({this.args, super.key});

  final D4uOrderDetailsPageArgs? args;

  late OrderProvider _model;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      appBarTitle: "Order Details",
      bottomNavigationBarWidget: _buildDuoButton(args?.isOrdersForMe, context),
      body: ChangeNotifierProvider(
        create: (context) => OrderProvider(orderId: args?.orderId ?? ''),
        builder: (context, child) {
          OrderProvider model = Provider.of<OrderProvider>(context);
          _model = model;
          SingleOrder? order = model.order;

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              D4uText(
                padding: D4uPadding.containerCenter,
                text: order?.product?.name ?? 'Product A',
                textStyle: D4uTextStyle.h1,
              ),
              D4uHorizontalProductCard(
                isCard: false,
                hideCloseButton: true,
                image: order?.product?.images?[0],
                seller: order?.product?.sellerName,
                serviceName: order?.product?.name,
                price: order?.product?.price,
                rating: 3,
                categories: order?.product?.categories,
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
                leftTextList: const [
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
                  '${order?.bookingId}',
                  '${order?.buyer?.name}',
                  (formatDate(order?.orderDate)),
                  '${order?.status}',
                  (formatDate(order?.startDate)),
                  (formatDate(order?.endDate)),
                  '${order?.location}',
                  'RM${order?.totalPrice?.toStringAsFixed(2)}',
                ],
              )
            ],
          );
        },
      ),
    );
  }

  _buildDuoButton(bool? isOrdersForMe, context) {
    if (isOrdersForMe ?? false) {
      return D4uDuoButton(
        padding: D4uPadding.a16,
        secondaryText: 'Cancel Order',
        primaryText: 'Accept Order',
        secondaryCallback: () async {
          await _model.updateOrderStatus(
            status: 'rejected',
            orderId: _model.order?.bookingId ?? '',
          );
          Navigator.pop(context);
        },
        primaryCallback: () async {
          await _model.updateOrderStatus(
            status: 'approved',
            orderId: _model.order?.bookingId ?? '',
          );
          Navigator.pop(context);
        },
      );
    } else {
      D4uSizedBox.shrink;
    }
  }
}
