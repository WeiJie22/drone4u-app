import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uSegmentedTab extends StatefulWidget {
  D4uSegmentedTab({
    super.key,
    this.options = const [],
    this.onChange,
  });

  List<String> options;
  Function(int)? onChange;

  @override
  State<D4uSegmentedTab> createState() => _D4uSegmentedTabState();
}

class _D4uSegmentedTabState extends State<D4uSegmentedTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: D4uPadding.containerCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.options.length,
          (index) => GestureDetector(
            onTap: () => {
              setState(() {
                selectedIndex = index;
                widget.onChange!(selectedIndex);
              })
            },
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: selectedIndex == index ? Colors.black : d4uBackground,
              ),
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear,
              child: D4uText(
                text: widget.options[index],
                fontWeight: selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
