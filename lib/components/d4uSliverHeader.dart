import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class D4uSliverHeader extends StatelessWidget {
  D4uSliverHeader({
    super.key,
    this.expandedHeight,
    this.showBackButton = false,
    this.appBarTitle,
    this.appBarLeading,
    this.leadingOnTap,
  });

  double? expandedHeight;
  bool showBackButton;
  String? appBarTitle;
  Widget? appBarLeading;
  VoidCallback? leadingOnTap;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FlexibleHeaderDelegate(
        statusBarHeight: MediaQuery.of(context).padding.top,
        expandedHeight: expandedHeight ?? 160,
        leading: showBackButton
            ? GestureDetector(
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
        background: MutableBackground(
          expandedWidget: Image.asset(
            'assets/mainPageImage.jpg',
            fit: BoxFit.cover,
          ),
          collapsedColor: d4uSecondaryColor,
        ),
        children: [
          FlexibleTextItem(
            text: appBarTitle ?? '',
            padding: D4uPadding.a16,
            expandedStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            expandedAlignment: Alignment.bottomLeft,
            collapsedAlignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
