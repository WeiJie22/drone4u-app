import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4uOrderDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uSuccessBookingPage extends StatelessWidget {
  const D4uSuccessBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d4uSecondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/completedBooking.png',
              height: 260,
              width: 260,
            ),
            D4uText(
              text: 'Success!',
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: D4uText(
                text: 'Your booking is pending for confirmation',
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: D4uPadding.a24,
        child: D4uDuoButton(
          primaryText: 'Go to Orders',
          secondaryText: 'Back',
          secondaryCallback: () => Navigator.pop(context),
          primaryCallback: () => Navigator.pushNamed(
            context,
            RouteName.orderDetailsPage,
            arguments: D4uOrderDetailsPageArgs(productName: 'Product A'),
          ),
        ),
      ),
    );
  }
}
