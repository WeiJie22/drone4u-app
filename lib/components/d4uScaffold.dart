import 'package:drone4u/components/d4uPageTitle.dart';
import 'package:drone4u/components/d4uText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uScaffold extends StatefulWidget {
  D4uScaffold({
    Key? key,
    this.appBar,
    this.color,
    @required this.body,
    this.centerAppBarTitle = false,
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
    this.scrollController,
  }) : super(key: key);

  Widget? appBar;
  Color? color;
  Widget? body;
  String? appBarTitle;
  bool centerAppBarTitle;
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
          controller: widget.scrollController,
          slivers: [
            widget.appBar ??
                SliverAppBar(
                  title: D4uText(text: widget.appBarTitle),
                  backgroundColor: d4uBackground,
                  elevation: widget.appBarElevation,
                  centerTitle: widget.centerAppBarTitle,
                  pinned: widget.pinAppBar,
                  floating: widget.floatAppBar,
                  snap: widget.snapAppBar,
                  expandedHeight: widget.expandedHeight,
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
