import 'package:dotted_line/dotted_line.dart';
import 'package:drone4u/components/d4uIndex.dart';
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
  });

  List<String> leftTextList;
  List<String> rightTextList;
  EdgeInsets padding;
  TextStyle? leftTextStyle;
  TextStyle? rightTextStyle;
  bool showDottedLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            )
          // Divider(
          //   color: d4uGray.withOpacity(0.5),
          //   thickness: 1,
          // )
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
        text: text,
        textAlign: TextAlign.right,
        textStyle: rightTextStyle,
      ),
    );
  }
}
