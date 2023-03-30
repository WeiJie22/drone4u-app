import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uSliverAppBar extends StatelessWidget {
  D4uSliverAppBar({
    Key? key,
    this.appBarTitle,
    this.appBarElevation,
    this.pinAppBar = true,
    this.floatAppBar = false,
    this.snapAppBar = false,
    this.showBackButton = true,
    this.leadingOnTap,
    this.appBarLeading,
    this.flexibleSpaceWidget,
    this.forceElevated = false,
  }) : super(key: key);

  String? appBarTitle;
  double? appBarElevation;
  bool pinAppBar;
  bool floatAppBar;
  bool snapAppBar;
  bool showBackButton;
  VoidCallback? leadingOnTap;
  Widget? appBarLeading;
  Widget? flexibleSpaceWidget;
  bool forceElevated;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: D4uText(
        text: appBarTitle,
        fontSize: 16,
      ),
      backgroundColor: d4uBackground,
      elevation: appBarElevation,
      forceElevated: forceElevated,
      centerTitle: true,
      pinned: pinAppBar,
      floating: floatAppBar,
      snap: snapAppBar,
      leading: showBackButton
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: leadingOnTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: appBarLeading ??
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  ),
            )
          : D4uSizedBox.shrink,
      flexibleSpace: flexibleSpaceWidget,
    );
  }
}
