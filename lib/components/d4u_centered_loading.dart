import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uCenteredLoading extends StatelessWidget {
  const D4uCenteredLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
