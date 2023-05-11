import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/components/d4u_loading_dialog.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/services/upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uUploadPage extends StatefulWidget {
  const D4uUploadPage({super.key});

  @override
  State<D4uUploadPage> createState() => _D4uUploadPageState();
}

class _D4uUploadPageState extends State<D4uUploadPage> {
  List<String> images = [];

  final _fbKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    UploadServiceConstant.serviceName: '',
    UploadServiceConstant.serviceDescription: '',
    UploadServiceConstant.servicePictures: [],
    UploadServiceConstant.servicePrice: '',
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
          primaryCallback: () async {
            if (_fbKey.currentState?.saveAndValidate() ?? false) {
              Map<String, dynamic> formValues =
                  _fbKey.currentState?.value ?? {};
              showDialog(
                context: context,
                builder: (_) => const D4uLoadingDialog(),
              );
              await UploadService.uploadFile(formValues).then((value) {
                // pop 2 times to close the dialog and the upload page
                Navigator.pop(context);
                Navigator.pop(context);
              });
            }
          },
          secondaryText: 'Cancel',
          secondaryCallback: () {
            Navigator.pop(context);
          },
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
            D4uTextField(
              onChanged: (_) {},
              name: UploadServiceConstant.servicePrice,
              placeHolder: "Price (Per Day)",
              validator: FormBuilderValidators.required(),
            ),
            D4uText(
              padding: D4uPadding.containerCenter,
              text: 'Photos',
              textStyle: D4uTextStyle.h3,
            ),
            Padding(
              padding: D4uPadding.h16,
              child: FormBuilderImagePicker(
                name: UploadServiceConstant.servicePictures,
                showDecoration: false,
                previewHeight: 80,
                previewWidth: 80,
                maxImages: 3,
                previewAutoSizeWidth: true,
                previewMargin: D4uPadding.r16,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
