import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uScaffold extends StatefulWidget {
  D4uScaffold({
    Key? key,
    @required this.body,
    this.appBarTitle = '',
    this.appBarLeading,
    this.pinAppBar = false,
    this.leadingOnTap,
    this.showBackButton = false,
    this.pageTitle = '',
    this.bottomNavigationBarWidget,
    this.flexibleSpaceWidget,
    this.expandedHeight,
    this.appBarElevation,
    this.floatAppBar = false,
    this.snapAppBar = false,
    this.sliverPersistentHeader,
    this.showSearchBar = false,
    this.onFilterIconPressed,
    this.showExpandedAppBar = false,
    this.forceElevated = false,
  }) : super(key: key);

  Widget? body;
  String? appBarTitle;
  Widget? appBarLeading;
  bool pinAppBar;
  VoidCallback? leadingOnTap;
  bool showBackButton;
  String? pageTitle;
  Widget? bottomNavigationBarWidget;
  Widget? flexibleSpaceWidget;
  double? expandedHeight;
  double? appBarElevation;
  bool snapAppBar;
  bool floatAppBar;
  Widget? sliverPersistentHeader;
  bool showSearchBar;
  VoidCallback? onFilterIconPressed;
  bool showExpandedAppBar;
  bool forceElevated;

  @override
  State<D4uScaffold> createState() => _D4uScaffoldState();
}

class _D4uScaffoldState extends State<D4uScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: d4uBackground,
        bottomNavigationBar: widget.bottomNavigationBarWidget,
        body: CustomScrollView(
          slivers: [
            !widget.showExpandedAppBar
                ? D4uSliverAppBar(
                    appBarElevation: widget.appBarElevation,
                    appBarLeading: widget.appBarLeading,
                    appBarTitle: widget.appBarTitle,
                    flexibleSpaceWidget: widget.flexibleSpaceWidget,
                    floatAppBar: widget.floatAppBar,
                    forceElevated: widget.forceElevated,
                    leadingOnTap: widget.leadingOnTap,
                    pinAppBar: widget.pinAppBar,
                    showBackButton: widget.showBackButton,
                    snapAppBar: widget.snapAppBar,
                  )
                : D4uSliverHeader(
                    expandedHeight: widget.expandedHeight,
                    showBackButton: widget.showBackButton,
                    appBarTitle: widget.appBarTitle,
                    appBarLeading: widget.appBarLeading,
                    leadingOnTap: widget.leadingOnTap,
                  ),
            if (widget.showSearchBar)
              SliverPersistentHeader(
                delegate: MyHeaderDelegate(onTap: widget.onFilterIconPressed),
                pinned: true,
              ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  widget.pageTitle == ""
                      ? D4uSizedBox.shrink
                      : D4uPageTitle(title: widget.pageTitle),
                  widget.body!,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  MyHeaderDelegate({this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: d4uBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: D4uTextField(
              hideLabelWhenFocused: true,
              name: 'search',
              placeHolder: 'Search',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.sort),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
