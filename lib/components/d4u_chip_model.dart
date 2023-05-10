import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/favourite_constant.dart';
import 'package:flutter/material.dart';

class D4uChipModel extends StatefulWidget {
  D4uChipModel({
    super.key,
    this.options = const [],
    required this.onChange,
  });

  List<String> options;
  Function? onChange;

  @override
  State<D4uChipModel> createState() => _D4uChipModelState();
}

class _D4uChipModelState extends State<D4uChipModel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.options.length,
          (index) => Padding(
            padding: index == 0 ? D4uPadding.l16 : D4uPadding.l4,
            child: ChoiceChip(
              selectedColor: Colors.black,
              label: D4uText(
                text: widget.options[index],
                color:
                    selectedIndex == index ? d4uSecondaryColor : Colors.black54,
              ),
              selected: selectedIndex == index,
              onSelected: (_) => setState(() {
                selectedIndex = index;
                widget.onChange!(selectedIndex);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
