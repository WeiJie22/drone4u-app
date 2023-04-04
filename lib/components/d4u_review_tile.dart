import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class D4uReviewTile extends StatelessWidget {
  D4uReviewTile({
    Key? key,
    this.sellerImage = '',
    this.userName,
    this.reviewTime = '',
    this.review = '',
    this.userRating = 0,
  }) : super(key: key);

  String sellerImage;
  String? userName;
  String? reviewTime;
  String? review;
  double userRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: D4uPadding.h16,
      child: Row(
        children: [
          Container(
            height: 120,
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage(sellerImage),
              radius: 26,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      D4uText(
                        text: userName,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      D4uText(
                        text: reviewTime,
                        color: d4uGray,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
                child: Wrap(
                  children: [
                    RatingBarIndicator(
                      rating: userRating,
                      itemCount: 5,
                      itemSize: 16,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: d4uYellow,
                      ),
                    ),
                    D4uText(
                      text: userRating.toString(),
                      padding: D4uPadding.h8,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 70,
                    maxWidth: MediaQuery.of(context).size.width - 85),
                child: D4uText(
                  text: review,
                  maxLines: 3,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
