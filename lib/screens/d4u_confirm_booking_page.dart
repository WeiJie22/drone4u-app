import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';

class D4uConfirmBookingPage extends StatefulWidget {
  const D4uConfirmBookingPage({super.key});

  @override
  State<D4uConfirmBookingPage> createState() => _D4uConfirmBookingPageState();
}

class _D4uConfirmBookingPageState extends State<D4uConfirmBookingPage> {
  bool needInsurance = false;
  bool tnc = false;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      appBarTitle: 'Confirm Booking',
      showBackButton: true,
      bottomNavigationBarWidget: D4uDuoButton(
        primaryText: 'Pay Deposit',
        primaryDisabled: !tnc,
        primaryCallback: () {
          Navigator.pop(context);
          Navigator.popAndPushNamed(
            context,
            RouteName.successBookingPage,
          );
        },
        secondaryCallback: () => Navigator.pop(context),
        secondaryText: 'Cancel',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          D4uHorizontalProductCard(
            isCard: false,
            hideCloseButton: true,
            image: 'assets/d4uDrone_road.jpg',
            seller: 'Drone4U',
            serviceName: 'Drone Photography',
            price: 100,
            rating: 3,
            categories: ['Photography', 'Drone'],
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
            (bool? value) => setState(() => needInsurance = value!),
            needInsurance,
          ),
          const D4uSectionTile(
            sectionTitle: 'Service Information',
            leftTextList: [
              'Product Name',
              'Product Description',
              'Order Rate',
              'Order Duration',
              'Order Date (Start)',
              'Order Date (End)',
              'Address',
            ],
            rightTextList: [
              'Product A',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut facilisis est. Aliquam vulputate lobortis ante eu convallis. Proin in massa',
              'RM100.00 / Day',
              '1 Day',
              '12/12/2020',
              '13/12/2020',
              'K-19-B, Tiara Damansara, Jalan 17/1, 46400 Petaling Jaya, Selangor',
            ],
          ),
          const D4uSectionTile(
            sectionTitle: 'Seller Information',
            leftTextList: [
              'Name',
              'Location',
            ],
            rightTextList: [
              '123456789',
              'S43, Taman Tun Dr Ismail, Jalan Dun, 04637, Kuala Lumpur',
            ],
          ),
          const D4uSectionTile(
            sectionTitle: 'Buyer Information',
            leftTextList: [
              'Order ID',
              'Username',
              'Order Amount',
            ],
            rightTextList: [
              '123456789',
              'Tan Ah Kow',
              'RM100.00',
            ],
          ),
          _buildCheckbox(
            'Terms & Conditions',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut facilisis est. Aliquam vulputate lobortis ante eu convallis. Proin in massa vel leo ullamcorper mattis. Nunc ante nisi, tempus a tortor sit amet, rutrum scelerisque lacus. Praesent aliquet auctor felis sed commodo. Vestibulum et laoreet ipsum. Integer sed elit lorem. Cras faucibus diam in ullamcorper mollis. Sed sed faucibus purus. Vivamus dolor arcu, laoreet eu diam id, facilisis pellentesque lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
            (bool? value) => setState(() => tnc = value!),
            tnc,
          ),
        ],
      ),
    );
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
}
