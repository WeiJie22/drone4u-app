import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uHorizontalSection extends StatefulWidget {
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
  State<D4uHorizontalSection> createState() => _D4uHorizontalSectionState();
}

class _D4uHorizontalSectionState extends State<D4uHorizontalSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
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
                      text: widget.sectionTitle,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    D4uText(
                      text: widget.sectionSubtitle,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: d4uGray,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: widget.viewAllOnTap,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  widget.servicesList != null || widget.servicesList!.isNotEmpty
                      ? widget.servicesList!
                          .map<D4uProductCard>(
                            (service) => D4uProductCard(
                              sellerName: 'roger',
                              productName: 'catan',
                              originalPrice: 100,
                              discountPrice: 80,
                              isDiscount: true,
                              reviewCount: '(20)',
                              imagePath: 'assets/mainPageImage.jpg',
                              productRating: 4.5,
                              showLabel: true,
                              labelText: '-20%',
                            ),
                          )
                          .toList()
                      : [],
            ),
          ),
        ],
      ),
    );
  }
}
