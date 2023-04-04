import 'package:drone4u/components/d4u_alert_dialog_tile.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uAlertDialog extends StatefulWidget {
  D4uAlertDialog({
    super.key,
    this.title = '',
    this.contentTitle,
    this.content,
    this.primaryCallback,
    this.secondaryCallback,
  });

  String? title;
  List<String>? contentTitle;
  List<String>? content;
  VoidCallback? primaryCallback;
  VoidCallback? secondaryCallback;

  @override
  State<D4uAlertDialog> createState() => _D4uAlertDialogState();
}

class _D4uAlertDialogState extends State<D4uAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: D4uText(text: 'Check booking details')),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      actions: [
        D4uDuoButton(
          primaryText: 'Confirm Booking',
          primaryCallback: widget.primaryCallback,
          secondaryText: 'Cancel',
          secondaryCallback: widget.secondaryCallback,
        )
      ],
      content: SizedBox(
        height: 300,
        width: 320,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.contentTitle?.length,
                itemBuilder: (context, index) {
                  return D4uAlertDialogTile(
                    title: widget.contentTitle![index],
                    content: widget.content![index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
