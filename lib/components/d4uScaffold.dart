import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/components/d4uPageTitle.dart';
import 'package:drone4u/components/d4uSliverHeader.dart';
import 'package:drone4u/components/d4uText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

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
  ScrollController? scrollController;
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
        body: SafeArea(
          child: CustomScrollView(
            controller: widget.scrollController,
            slivers: [
              !widget.showExpandedAppBar
                  ? SliverAppBar(
                      title: D4uText(text: widget.appBarTitle),
                      backgroundColor: d4uBackground,
                      elevation: widget.appBarElevation,
                      forceElevated: widget.forceElevated,
                      centerTitle: true,
                      pinned: widget.pinAppBar,
                      floating: widget.floatAppBar,
                      snap: widget.snapAppBar,
                      leading: widget.showBackButton
                          ? GestureDetector(
                              onTap: widget.leadingOnTap ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: widget.appBarLeading ??
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                            )
                          : D4uSizedBox.shrink,
                      flexibleSpace: widget.flexibleSpaceWidget,
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
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
