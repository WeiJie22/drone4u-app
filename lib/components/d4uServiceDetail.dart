import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';

class D4uServiceDetail extends StatelessWidget {
  D4uServiceDetail({
    Key? key,
    this.productName = '',
    this.price = 0,
    this.rating = 0,
    this.review = 0,
    this.isFavorite = false,
  }) : super(key: key);

  String? productName;
  double? price;
  double? rating;
  int? review;
  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            D4uText(
              text: productName,
              fontSize: 26,
              fontWeight: FontWeight.w500,
              padding: D4uPadding.h16,
            ),
            D4uText(
              text: 'RM ${price?.toStringAsFixed(2)} / day',
              color: d4uPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              padding: D4uPadding.containerCenter,
            ),
            Padding(
              padding: D4uPadding.h16,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: d4uYellow,
                    size: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 12, 0),
                    child: D4uText(
                      text: rating?.toStringAsFixed(1),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  D4uText(
                    text: '${review?.toString()} Reviews',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            print('he');
          },
          child: Container(
            padding: D4uPadding.a24,
            child: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: d4uPrimaryColor,
                    size: 34,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: d4uGray,
                    size: 34,
                  ),
          ),
        ),
      ],
    );
  }
}
