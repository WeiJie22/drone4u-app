import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/screens/d4u_service_detail_page.dart';
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

  List<Product>? servicesList;
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
          // SizedBox(
          //   height: 240,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: servicesList?.length ?? 0,
          //     itemBuilder: (context, idx) {
          //       return Padding(
          //         padding: idx == servicesList!.length - 1
          //             ? D4uPadding.r16
          //             : D4uPadding.zero,
          //         child: D4uProductCard(
          //           productName: servicesList![idx].name ?? '',
          //           sellerName: "SELLER NAME",
          //           productRating: servicesList![idx].productRating ?? 0,
          //           reviewCount:
          //               servicesList![idx].reviewCount.toString() ?? '0',
          //           price: servicesList![idx].price ?? 0,
          //           discountPrice: servicesList![idx].discountPrice ?? 0,
          //           height: 240,
          //           width: 160,
          //           imageHeight: 160,
          //           imageWidth: 160,
          //           imageAlignment: Alignment.center,
          //           onPressedProduct: () {
          //             Navigator.pushNamed(
          //               context,
          //               RouteName.serviceDetailPage,
          //               arguments: D4uServiceDetailPageArgs(
          //                 productName: servicesList![idx].name ?? '',
          //               ),
          //             );
          //           },
          //           onPressedFavorite: () => print('Favorite'),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
