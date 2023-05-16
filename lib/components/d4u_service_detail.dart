import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:flutter/material.dart';

class D4uServiceDetail extends StatelessWidget {
  D4uServiceDetail({
    Key? key,
    this.productName = '',
    this.sellerName = '',
    this.sellerImage = '',
    this.productDescription = '',
    this.price = 0,
    this.rating = 0,
    this.review = 0,
    this.favPositionBottom = 60,
    this.favPositionRight = -6,
    this.showFavorite = true,
    this.isOfficialStore = true,
    this.onPressedCircularIcon,
    this.isFavourite = false,
  }) : super(key: key);

  String? productName;
  String? sellerName;
  String sellerImage;
  String? productDescription;
  double? price;
  double? rating;
  double? favPositionBottom;
  double? favPositionRight;
  int? review;
  bool isOfficialStore;
  bool showFavorite;
  Function? onPressedCircularIcon;
  bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  text: 'RM${price?.toStringAsFixed(2)} / day',
                  color: d4uPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  padding: D4uPadding.containerCenter,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: d4uYellow,
                        size: 16,
                      ),
                      D4uText(
                        text: rating?.toStringAsFixed(1),
                        padding: const EdgeInsets.fromLTRB(4, 0, 12, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
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
            showFavorite
                ? D4uCircularButton(
                    active: isFavourite,
                    onPressed: (val) {
                      showFavorite ? onPressedCircularIcon!(val) : null;
                    },
                  )
                : D4uSizedBox.shrink,
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: D4uPadding.a24,
            //     child: isFavorite
            //         ? const Icon(
            //             Icons.favorite,
            //             color: d4uPrimaryColor,
            //             size: 34,
            //           )
            //         : const Icon(
            //             Icons.favorite_outline,
            //             color: d4uGray,
            //             size: 34,
            //           ),
            //   ),
            // ),
          ],
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
        Padding(
          padding: D4uPadding.a16,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(sellerImage),
                radius: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  D4uText(
                    text: sellerName,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    padding: D4uPadding.h16,
                  ),
                  isOfficialStore
                      ? D4uText(
                          text: 'Official Store ✅',
                          fontSize: 14,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        )
                      : Container(),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              D4uText(
                text: 'Description Product',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                padding: D4uPadding.a16,
              ),
              D4uText(
                text: productDescription,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 1.5,
                padding: D4uPadding.h16,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}
