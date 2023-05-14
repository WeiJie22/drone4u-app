import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/components/d4u_order_card.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/order.dart';
import 'package:drone4u/providers/orders_provider.dart';
import 'package:drone4u/screens/d4u_order_details_page.dart';
import 'package:drone4u/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class D4uOrdersPage extends StatefulWidget {
  const D4uOrdersPage({super.key});

  @override
  State<D4uOrdersPage> createState() => _D4uOrdersPageState();
}

class _D4uOrdersPageState extends State<D4uOrdersPage> {
  List<String> options = ["buyOrders", "sellOrders"];
  List<String> optionsMapping = ["Own orders", "Orders for me"];
  int selectedIndex = 0;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d4uBackground,
      body: ChangeNotifierProvider(
        create: (context) => OrderProvider(initAllOrders: true),
        builder: (context, child) {
          OrderProvider model = Provider.of<OrderProvider>(context);
          Map<String, List<SingleOrder>> allOrders = model.allOrders;

          List<SingleOrder> orders = allOrders[options[selectedIndex]] ?? [];

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              D4uSliverAppBar(
                showBackButton: false,
                appBarTitle: 'Orders',
              )
            ],
            body: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              primary: false,
              onRefresh: () async {
                await model.initAllOrdersData();
                _refreshController.refreshCompleted();
              },
              child: Column(
                children: [
                  D4uSegmentedTab(
                    options: optionsMapping,
                    onChange: (val) {
                      setState(() {
                        selectedIndex = val;
                      });
                    },
                  ),
                  Expanded(
                    child: orders.isEmpty
                        ? const Center(
                            child: Text('No Orders'),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: orders.length,
                            itemBuilder: (context, idx) {
                              SingleOrder order = orders[idx];
                              return D4uOrderCard(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.orderDetailsPage,
                                    arguments: D4uOrderDetailsPageArgs(
                                      orderId: order.bookingId,
                                      isOrdersForMe: selectedIndex == 1 &&
                                          order.status?.toLowerCase() ==
                                              'pending',
                                    ),
                                  );
                                },
                                status: order.status ?? 'UNKNOWN',
                                serviceName: order.product?.name,
                                price: order.totalPrice,
                                leftTextList: const [
                                  "Order ID",
                                  'User name',
                                  "Service Start Date",
                                  "Service End Date",
                                ],
                                rightTextList: [
                                  '${order.bookingId}',
                                  "${order.buyer?.name}",
                                  (formatDate(order.startDate)),
                                  (formatDate(order.endDate)),
                                ],
                              );
                            }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
