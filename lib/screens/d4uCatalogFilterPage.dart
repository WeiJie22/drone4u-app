import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uCatalogFilterPage extends StatefulWidget {
  const D4uCatalogFilterPage({super.key});

  @override
  State<D4uCatalogFilterPage> createState() => D4uCatalogFilterPageState();
}

class D4uCatalogFilterPageState extends State<D4uCatalogFilterPage> {
  List<FormBuilderFieldOption<String>> options = [
    const FormBuilderFieldOption(value: 'A'),
    const FormBuilderFieldOption(value: 'B'),
    const FormBuilderFieldOption(value: 'C'),
    const FormBuilderFieldOption(value: 'D'),
    const FormBuilderFieldOption(value: 'E'),
    const FormBuilderFieldOption(value: 'F'),
  ];

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      appBarTitle: 'Filter',
      showBackButton: true,
      body: Column(
        children: [],
      ),
    );
  }
}
