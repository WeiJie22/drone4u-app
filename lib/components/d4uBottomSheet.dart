import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uBottomSheet extends StatefulWidget {
  D4uBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  State<D4uBottomSheet> createState() => _D4uBottomSheetState();
}

class _D4uBottomSheetState extends State<D4uBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return D4uSingleButton(
      text: 'Book Now',
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    );
  }
}
