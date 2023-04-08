import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uUploadPage extends StatefulWidget {
  const D4uUploadPage({super.key});

  @override
  State<D4uUploadPage> createState() => _D4uUploadPageState();
}

class _D4uUploadPageState extends State<D4uUploadPage> {
  List<String> images = [];

  final _fbKey = GlobalKey<FormBuilderState>();

  int length = 1;

  Map<String, dynamic> formValues = {
    UploadServiceConstant.serviceName: '',
    UploadServiceConstant.serviceDescription: '',
    UploadServiceConstant.servicePictures: [],
  };

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      pageTitle: 'Upload Your Service',
      bottomNavigationBarWidget: Padding(
        padding: D4uPadding.a16,
        child: D4uDuoButton(
          primaryText: 'Add Service',
          primaryCallback: () {
            if (_fbKey.currentState?.saveAndValidate() ?? false) {
              print(_fbKey.currentState!.value);
            }
          },
          secondaryText: 'Cancel',
          secondaryCallback: () {},
        ),
      ),
      body: FormBuilder(
        key: _fbKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            D4uText(
              padding: D4uPadding.a16,
              text: 'Service Information',
              textStyle: D4uTextStyle.h3,
            ),
            D4uTextField(
              onChanged: (_) {},
              name: UploadServiceConstant.serviceName,
              placeHolder: "Full Name",
              validator: FormBuilderValidators.required(),
            ),
            D4uTextField(
              onChanged: (_) {},
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              alignLabelWithHint: true,
              name: UploadServiceConstant.serviceDescription,
              placeHolder: "Service Description",
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(
              height: 10,
            ),
            D4uText(
              padding: D4uPadding.a16,
              text: 'Photos',
              textStyle: D4uTextStyle.h3,
            ),
            SingleChildScrollView(
              padding: D4uPadding.l8,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    length,
                    (index) => Padding(
                      padding: D4uPadding.h8,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/d4uDrone_road.jpg' ?? ''),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        length++;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: d4uGray.withOpacity(0.15),
                      ),
                      child: const Center(
                        child: Icon(Icons.file_upload_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
