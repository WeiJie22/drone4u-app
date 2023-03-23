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
  }) : super(key: key);

  SliverAppBar? appBar;
  Color? color;
  Widget? body;
  String? appBarTitle;
  bool centerAppBarTitle;
  Widget? appBarLeading;
  bool pinAppBar;
  VoidCallback? leadingOnTap;
  bool showBackButton;
  String? pageTitle;

  @override
  State<D4uScaffold> createState() => _D4uScaffoldState();
}

class _D4uScaffoldState extends State<D4uScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d4uBackground,
      body: CustomScrollView(
        slivers: [
          widget.appBar ??
              SliverAppBar(
                title: D4uText(text: widget.appBarTitle),
                backgroundColor: d4uBackground,
                elevation: 0,
                centerTitle: widget.centerAppBarTitle,
                pinned: widget.pinAppBar,
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
                    : d4uSizedBox.shrink,
              ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                D4uPageTitle(title: widget.pageTitle),
                widget.body!,
              ],
            ),
          )
        ],
      ),
    );
  }
}
