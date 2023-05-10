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
        collapsedElevation: 0.5,
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
          collapsedColor: d4uPrimaryColor,
        ),
        children: [
          FlexibleTextItem(
            text: appBarTitle ?? '',
            padding: D4uPadding.a16,
            expandedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: getTextColor(Colors.blue),
            ),
            expandedAlignment: Alignment.bottomLeft,
            collapsedAlignment: Alignment.center,
            collapsedStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: d4uSecondaryColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Color getTextColor(Color color) {
    int d = 0;

// Counting the perceptive luminance - human eye favors green color...
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    if (luminance > 0.5) {
      d = 0; // bright colors - black font
    } else {
      d = 255; // dark colors - white font
    }

    return Color.fromARGB(color.alpha, d, d, d);
  }
}
