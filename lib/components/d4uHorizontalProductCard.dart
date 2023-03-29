import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class D4uHorizontalProductCard extends StatelessWidget {
  D4uHorizontalProductCard({
    super.key,
    this.image = 'assets/d4uDrone_road.jpg',
    this.seller = '',
    this.serviceName = '',
    this.price,
    this.rating = 3,
    this.categories,
    this.cardHeight = 100,
  });

  String? image;
  String? seller;
  String? serviceName;
  double? price;
  double? rating;
  List<String>? categories;
  double? cardHeight;

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
        height: cardHeight,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image ?? ''),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                ),
                height: cardHeight,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: D4uPadding.containerCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              D4uText(
                                text: seller,
                                fontSize: 12,
                                color: d4uGray,
                              ),
                              D4uText(
                                text: serviceName,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  categories?.length ?? 0,
                                  (index) => D4uLabel(
                                    labelType: LabelType.bordered,
                                    padding: const EdgeInsets.only(
                                      right: 4,
                                      top: 4,
                                    ),
                                    labelText: categories?[index] ?? '',
                                  ),
                                ),
                              )
                            ],
                          ),
                          D4uText(
                            text: "RM${price?.toStringAsFixed(2)}",
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: d4uGray,
                          ),
                          onTap: () {},
                        ),
                        RatingBarIndicator(
                          rating: rating ?? 0,
                          itemCount: 5,
                          itemSize: 12,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: d4uYellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
