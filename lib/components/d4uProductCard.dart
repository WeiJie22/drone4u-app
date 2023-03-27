import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/routes.dart';

class D4uProductCard extends StatefulWidget {
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

  @override
  State<D4uProductCard> createState() => _D4uProductCardState();
}

class _D4uProductCardState extends State<D4uProductCard> {
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, RouteName.servcieDetailPage),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.imageHeight,
                      width: widget.imageWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          widget.imagePath,
                          alignment: widget.imageAlignment,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: D4uPadding.v4,
                      child: Row(
                        children: [
                          RatingBarIndicator(
                            rating: widget.productRating,
                            itemCount: 5,
                            itemSize: 12,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: d4uYellow,
                            ),
                          ),
                          D4uText(
                            text: widget.reviewCount!,
                            fontSize: 10,
                            color: d4uGray,
                          ),
                        ],
                      ),
                    ),
                    D4uText(
                      text: widget.sellerName!.toCapitalized(),
                      fontSize: 12,
                      color: d4uGray,
                    ),
                    D4uText(
                      text: widget.productName!.toCapitalized(),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: widget.color,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    widget.isDiscount
                        ? Row(
                            children: [
                              D4uText(
                                text:
                                    'RM${widget.originalPrice?.toStringAsFixed(2)}',
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
                                  text:
                                      'RM${widget.discountPrice?.toStringAsFixed(2)}',
                                  fontWeight: FontWeight.normal,
                                  color: d4uPrimaryColor,
                                ),
                              ),
                            ],
                          )
                        : D4uText(
                            text: 'RM ${widget.originalPrice}',
                            fontWeight: FontWeight.normal,
                            color: widget.color,
                          ),
                  ]),
            ),
          ),
          widget.showFavorite
              ? Positioned(
                  bottom: widget.favPositionBottom,
                  right: widget.favPositionRight,
                  child: ElevatedButton(
                    onPressed: widget.onPressedFavorite ??
                        () {
                          setState(() {
                            _favourite = !_favourite;
                          });
                        },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: d4uSecondaryColor, // <-- Button color
                      foregroundColor: d4uBackground, // <-- Splash color
                    ),
                    child: widget.isFavourite
                        ? const Icon(
                            Icons.favorite,
                            color: d4uPrimaryColor,
                            size: 18,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: d4uGray,
                            size: 18,
                          ),
                  ),
                )
              : Container(),
          Positioned(
            top: 14,
            left: 8,
            child: widget.showLabel
                ? D4uLabel(labelText: widget.labelText ?? '')
                : Container(),
          )
        ],
      ),
    );
  }
}
