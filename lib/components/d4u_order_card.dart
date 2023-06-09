import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uOrderCard extends StatelessWidget {
  D4uOrderCard({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.onTap,
    this.serviceName,
    this.price,
    this.status,
  });

  List<String> leftTextList;
  List<String> rightTextList;
  VoidCallback? onTap;
  String? serviceName;
  double? price;
  String? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: D4uPadding.containerCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: d4uSecondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: D4uPadding.containerCenter,
          child: Column(
            children: [
              _buildCardTitle(),
              const SizedBox(height: 8),
              D4uInfoList(
                leftTextList: leftTextList,
                rightTextList: rightTextList,
              ),
              const Divider(
                indent: 2,
                endIndent: 2,
              ),
              _buildLastRow()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        D4uText(
          fontSize: 16,
          text: "RM${price?.toStringAsFixed(2)}",
        ),
        Padding(
          padding: D4uPadding.b4,
          child: SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: d4uPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              onPressed: onTap,
              child: D4uText(
                color: d4uSecondaryColor,
                fontSize: 14,
                text: "Details",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: D4uText(
            text: serviceName,
            maxLines: 2,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        D4uLabel(
          labelText: status!.toUpperCase(),
          padding: EdgeInsets.zero,
          labelType: LabelType.bordered,
          labelColor: status == 'pending'
              ? d4uPrimaryColor
              : status == 'approved'
                  ? Colors.green
                  : status == 'rejected'
                      ? Colors.black
                      : Colors.grey,
        )
      ],
    );
  }
}
