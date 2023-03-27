import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uHorizontalSection extends StatelessWidget {
  D4uHorizontalSection({
    Key? key,
    this.servicesList,
    this.sectionTitle = '',
    this.sectionSubtitle = '',
    this.viewAllOnTap,
    this.padding = D4uPadding.t16,
  }) : super(key: key);

  List<D4uProductCard>? servicesList;
  String? sectionTitle;
  String? sectionSubtitle;
  VoidCallback? viewAllOnTap;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Padding(
            padding: D4uPadding.h16,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    D4uText(
                      text: sectionTitle,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    D4uText(
                      text: sectionSubtitle,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: d4uGray,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: viewAllOnTap,
                  child: Row(
                    children: [
                      D4uText(
                        text: 'View All',
                        fontSize: 12,
                      ),
                      const Icon(
                        Icons.arrow_right_alt,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: servicesList != null || servicesList!.isNotEmpty
                  ? servicesList!.map<D4uProductCard>((card) => card).toList()
                  : [],
            ),
          ),
        ],
      ),
    );
  }
}
