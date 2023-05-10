import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uSectionTile extends StatelessWidget {
  const D4uSectionTile({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.sectionTitle,
  });

  final List<String> leftTextList;
  final List<String> rightTextList;
  final String? sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          D4uText(
            text: sectionTitle ?? '',
            padding: D4uPadding.containerCenter4,
            textStyle: D4uTextStyle.h2,
          ),
          D4uInfoList(
            backgroundColor: Colors.white,
            showDivider: true,
            padding: D4uPadding.containerCenter,
            leftTextStyle: D4uTextStyle.labelText,
            rightTextStyle: D4uTextStyle.labelTextBold,
            leftTextList: leftTextList,
            rightTextList: rightTextList,
          ),
          Container(
            height: 16,
            width: double.infinity,
            color: d4uBackground,
          ),
        ],
      ),
    );
  }
}
