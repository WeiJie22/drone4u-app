import 'package:dotted_line/dotted_line.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uInfoList extends StatelessWidget {
  D4uInfoList({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.leftTextStyle = const TextStyle(
      fontSize: 12,
    ),
    this.rightTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    this.padding = D4uPadding.zero,
    this.showDottedLine = false,
    this.showDivider = false,
    this.backgroundColor,
  });

  List<String> leftTextList;
  List<String> rightTextList;
  EdgeInsets padding;
  TextStyle? leftTextStyle;
  TextStyle? rightTextStyle;
  bool showDottedLine;
  bool showDivider;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Column(
        children: _buildInfoList(leftTextList, rightTextList),
      ),
    );
  }

  List<Widget> _buildInfoList(leftTextList, rightTextList) {
    return List.generate(
      leftTextList.length,
      (index) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: _buildLeftText(leftTextList[index]),
              ),
              Expanded(
                flex: 6,
                child: _buildRightText(rightTextList[index]),
              ),
            ],
          ),
          if (showDottedLine)
            Padding(
              padding: D4uPadding.v8,
              child: DottedLine(
                dashColor: d4uGray.withOpacity(0.5),
              ),
            ),
          if (showDivider && index != leftTextList.length - 1)
            Divider(
              color: d4uGray.withOpacity(0.5),
              thickness: 1,
            ),
        ],
      ),
    );
  }

  Widget _buildLeftText(String text) {
    return Padding(
      padding: D4uPadding.a2,
      child: D4uText(
        text: text,
        textStyle: leftTextStyle,
      ),
    );
  }

  Widget _buildRightText(String text) {
    return Padding(
      padding: D4uPadding.a2,
      child: D4uText(
        maxLines: 3,
        text: text,
        textAlign: TextAlign.right,
        textStyle: rightTextStyle,
      ),
    );
  }
}
