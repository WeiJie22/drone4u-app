import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uProfileTile extends StatelessWidget {
  D4uProfileTile({
    Key? key,
    this.title = '',
    this.content = '',
    this.onTap,
  }) : super(key: key);

  String title;
  String? content;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                D4uText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
                D4uText(
                  text: content,
                  fontSize: 12,
                  color: d4uGray,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Icon(
              Icons.chevron_right,
              size: 30,
              color: d4uGray,
            ),
          ),
        ],
      ),
    );
  }
}
