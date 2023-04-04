import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:flutter/material.dart';

class D4uReviewTitle extends StatelessWidget {
  D4uReviewTitle({
    Key? key,
    this.review,
    this.rating,
    this.viewAllOnTap,
  }) : super(key: key);

  int? review;
  double? rating;
  VoidCallback? viewAllOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        D4uText(
          text: 'Review ($review)',
          fontWeight: FontWeight.bold,
          padding: D4uPadding.a16,
          fontSize: 18,
        ),
        const Spacer(),
        const Icon(
          Icons.star,
          color: d4uYellow,
          size: 16,
        ),
        D4uText(
          text: rating?.toStringAsFixed(1),
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: viewAllOnTap,
          child: Row(
            children: [
              D4uText(
                text: 'View All',
                padding: D4uPadding.h16,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
