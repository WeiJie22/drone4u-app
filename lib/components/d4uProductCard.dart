import 'package:drone4u/components/d4uCircularButton.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class D4uProductCard extends StatelessWidget {
  D4uProductCard({
    Key? key,
    this.productName = '',
    this.sellerName = '',
    this.reviewCount = '',
    this.imagePath = '',
    this.labelText = '',
    this.discountPrice = 0,
    this.originalPrice = 0,
    this.height = 250,
    this.width = 150,
    this.imageHeight = 160,
    this.imageWidth = 130,
    this.fontSize,
    this.favPositionBottom = 60,
    this.favPositionRight = -6,
    this.productRating = 0,
    this.showLabel = false,
    this.isFavourite = false,
    this.isDiscount = false,
    this.showFavorite = true,
    this.fontWeight,
    this.overflow,
    this.imageAlignment = Alignment.bottomCenter,
    this.color = Colors.black,
    this.onPressedProduct,
    this.onPressedFavorite,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 0, 0),
  }) : super(key: key);

  String? productName;
  String? sellerName;
  String? reviewCount;
  String imagePath;
  String? labelText;
  double? discountPrice;
  double? originalPrice;
  double? height;
  double? width;
  double? imageHeight;
  double? imageWidth;
  double? fontSize;
  double? favPositionBottom;
  double? favPositionRight;
  double productRating;
  bool showLabel;
  bool isFavourite;
  bool isDiscount;
  bool showFavorite;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  Alignment imageAlignment;
  Color? color;
  VoidCallback? onPressedProduct;
  VoidCallback? onPressedFavorite;
  EdgeInsets padding;
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, RouteName.servcieDetailPage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: imageWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePath,
                      alignment: imageAlignment,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: D4uPadding.v4,
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: productRating,
                        itemCount: 5,
                        itemSize: 12,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: d4uYellow,
                        ),
                      ),
                      D4uText(
                        text: reviewCount!,
                        fontSize: 10,
                        color: d4uGray,
                      ),
                    ],
                  ),
                ),
                D4uText(
                  text: sellerName!.toCapitalized(),
                  fontSize: 12,
                  color: d4uGray,
                ),
                D4uText(
                  text: productName!.toCapitalized(),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
                const SizedBox(
                  height: 2,
                ),
                isDiscount
                    ? Row(
                        children: [
                          D4uText(
                            text: 'RM${originalPrice?.toStringAsFixed(2)}',
                            textDecoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.normal,
                            color: d4uGray,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: D4uText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: 'RM${discountPrice?.toStringAsFixed(2)}',
                              fontWeight: FontWeight.normal,
                              color: d4uPrimaryColor,
                            ),
                          ),
                        ],
                      )
                    : D4uText(
                        text: 'RM $originalPrice',
                        fontWeight: FontWeight.normal,
                        color: color,
                      ),
              ],
            ),
          ),
          showFavorite
              ? Positioned(
                  bottom: favPositionBottom,
                  right: favPositionRight,
                  child: D4uCircularButton(),
                )
              : D4uSizedBox.shrink,
          showLabel
              ? Positioned(
                  left: 8,
                  top: 8,
                  child: D4uLabel(
                      padding: EdgeInsets.zero, labelText: labelText ?? ''),
                )
              : D4uSizedBox.shrink,
        ],
      ),
    );
  }
}
