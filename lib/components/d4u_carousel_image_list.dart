import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uCarouselImageList extends StatefulWidget {
  D4uCarouselImageList({
    Key? key,
    this.carouselImageList = const [],
  }) : super(key: key);

  final List<String> carouselImageList;

  @override
  State<D4uCarouselImageList> createState() => _D4uCarouselImageListState();
}

class _D4uCarouselImageListState extends State<D4uCarouselImageList> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: D4uPadding.b4,
          child: SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.carouselImageList.length,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.carouselImageList[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        if (widget.carouselImageList.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.carouselImageList.length,
              (index) => Padding(
                padding: D4uPadding.a2,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: index == activePage ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: index == activePage
                        ? d4uPrimaryColor
                        : d4uPrimaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
