import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uBottomSheet extends StatefulWidget {
  D4uBottomSheet({
    Key? key,
    required this.child,
    this.elevation = false,
  }) : super(key: key);

  Widget child;
  bool elevation;

  @override
  State<D4uBottomSheet> createState() => _D4uBottomSheetState();
}

class _D4uBottomSheetState extends State<D4uBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return D4uSingleButton(
      text: 'Book Now',
      elevation: widget.elevation,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (context) => widget.child,
        );
      },
      padding: D4uPadding.containerCenter,
    );
  }
}
