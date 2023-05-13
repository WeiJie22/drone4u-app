import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/models/order.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/providers/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class D4uConfirmBookingPageArgs {
  D4uConfirmBookingPageArgs({
    this.product,
    this.formValues,
  });

  Product? product;
  SingleOrder? formValues;
}

class D4uConfirmBookingPage extends StatefulWidget {
  const D4uConfirmBookingPage({this.args, super.key});

  final D4uConfirmBookingPageArgs? args;

  @override
  State<D4uConfirmBookingPage> createState() => _D4uConfirmBookingPageState();
}

class _D4uConfirmBookingPageState extends State<D4uConfirmBookingPage> {
  bool needInsurance = false;
  bool tnc = false;
  late OrderProvider _model;

  @override
  Widget build(BuildContext context) {
    Product product = widget.args!.product!;
    SingleOrder order = widget.args!.formValues!;

    return D4uScaffold(
      appBarTitle: 'Confirm Booking',
      showBackButton: true,
      bottomNavigationBarWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          D4uDuoButton(
            primaryText: 'Pay Deposit',
            primaryDisabled: !tnc,
            primaryCallback: () async {
              showDialog(
                context: context,
                builder: (_) => const D4uLoadingDialog(),
              );
              await _model.confirmBooking(context);
            },
            secondaryCallback: () => Navigator.pop(context),
            secondaryText: 'Cancel',
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => OrderProvider(order: order, product: product),
        builder: (context, child) {
          OrderProvider model = Provider.of<OrderProvider>(context);
          _model = model;

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              D4uHorizontalProductCard(
                isCard: false,
                hideCloseButton: true,
                image: model.product?.images?[0],
                seller: model.product?.sellerName,
                serviceName: model.product?.name,
                price: model.product?.price,
                rating: 3,
                categories: model.product?.categories,
                cardHeight: 115,
              ),
              Container(
                height: 16,
                width: double.infinity,
                color: d4uBackground,
              ),
              _buildCheckbox(
                'Insurance Coverage',
                'I agree to pay RM10.00 for insurance coverage',
                (bool? value) => setState(() {
                  needInsurance = value!;
                  model.order?.insurance = needInsurance;
                  print('Modle => ${model.order?.toJson()}');
                }),
                needInsurance,
              ),
              D4uSectionTile(
                sectionTitle: 'Service Information',
                leftTextList: [
                  'Product Name',
                  'Product Description',
                  'Order Rate',
                  'Order Duration',
                  'Order Date (Start)',
                  if (model.order?.endDate != null) 'Order Date (End)',
                  'Address',
                ],
                rightTextList: [
                  model.product?.name ?? '',
                  model.product?.description ?? '',
                  'RM${product.price?.toStringAsFixed(2)} / Day',
                  '${calculateDuration(model.order)} Day(s)',
                  formatDate(model.order?.startDate),
                  if (model.order?.endDate != null)
                    formatDate(model.order?.endDate!),
                  model.order?.location ?? '',
                ],
              ),
              D4uSectionTile(
                sectionTitle: 'Seller Information',
                leftTextList: const [
                  'Name',
                  'Location',
                ],
                rightTextList: [
                  '${model.product?.sellerName}',
                  'S43, Taman Tun Dr Ismail, Jalan Dun, 04637, Kuala Lumpur',
                ],
              ),
              D4uSectionTile(
                sectionTitle: 'Buyer Information',
                leftTextList: const [
                  'Order ID',
                  'Username',
                  'Order Amount',
                ],
                rightTextList: [
                  '${model.order?.bookingId}',
                  '${model.product?.name}',
                  '${_calculateTotalPrice(model.order?.totalPrice, needInsurance)}',
                ],
              ),
              _buildCheckbox(
                'Terms & Conditions',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut facilisis est. Aliquam vulputate lobortis ante eu convallis. Proin in massa vel leo ullamcorper mattis. Nunc ante nisi, tempus a tortor sit amet, rutrum scelerisque lacus. Praesent aliquet auctor felis sed commodo. Vestibulum et laoreet ipsum. Integer sed elit lorem. Cras faucibus diam in ullamcorper mollis. Sed sed faucibus purus. Vivamus dolor arcu, laoreet eu diam id, facilisis pellentesque lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                (bool? value) => setState(() => tnc = value!),
                tnc,
              ),
            ],
          );
        },
      ),
    );
  }

  _calculateTotalPrice(double? totalPrice, bool needInsurance) {
    return 'RM${needInsurance ? (totalPrice! + 10).toStringAsFixed(2) : totalPrice!.toStringAsFixed(2)}';
  }

  Column _buildCheckbox(
      String msgTitle, String msg, Function(bool?) onChanged, bool value) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: D4uPadding.containerCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  activeColor: d4uPrimaryColor,
                  value: value,
                  onChanged: onChanged,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: D4uPadding.l8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (msgTitle.isNotEmpty)
                        D4uText(
                          text: msgTitle,
                          textStyle: D4uTextStyle.h3,
                        ),
                      D4uText(
                        text: msg,
                        textStyle: D4uTextStyle.labelText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 16,
          width: double.infinity,
          color: d4uBackground,
        ),
      ],
    );
  }

  String formatDate(DateTime? dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
  }

  int calculateDuration(SingleOrder? order) {
    if (order?.endDate != null) {
      return order!.endDate!.difference(order.startDate!).inDays + 1;
    }
    return 1;
  }
}
