import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/providers/manage_products_provider.dart';
import 'package:drone4u/services/product_service.dart';
import 'package:drone4u/services/upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class D4uEditProductPageArgs {
  String? productId;

  D4uEditProductPageArgs({this.productId});
}

class D4uEditProductPage extends StatelessWidget {
  D4uEditProductPage({this.args, super.key});

  final D4uEditProductPageArgs? args;

  late GlobalKey<FormBuilderState> _fbKey;

  Map<String, dynamic> formValues = {
    UploadServiceConstant.serviceName: '',
    UploadServiceConstant.serviceDescription: '',
    UploadServiceConstant.servicePictures: [],
    UploadServiceConstant.servicePrice: '',
  };

  List initialImage = [];

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      pageTitle: 'Edit your product',
      bottomNavigationBarWidget: D4uDuoButton(
        primaryFlex: 1,
        primaryText: 'UPDATE PRODUCT',
        primaryCallback: () async {
          if (_fbKey.currentState!.saveAndValidate()) {
            _updateProduct(
              context,
              args?.productId,
              _fbKey.currentState!.value,
            );
          }
        },
        secondaryFlex: 1,
        secondaryText: 'DELETE PRODUCT',
        secondaryCallback: () {
          _showDialog(context, args?.productId);
        },
      ),
      body: ChangeNotifierProvider(
        create: (context) => ManageProductsProvider(productId: args?.productId),
        builder: (context, child) {
          ManageProductsProvider model =
              Provider.of<ManageProductsProvider>(context);

          if (model.isLoading) {
            return const D4uCenteredLoading();
          }

          formValues[UploadServiceConstant.serviceName] = model.product?.name;
          formValues[UploadServiceConstant.serviceDescription] =
              model.product?.description;
          formValues[UploadServiceConstant.servicePrice] =
              model.product?.price?.toStringAsFixed(2);
          initialImage = model.product?.images ?? [];

          _fbKey = GlobalKey<FormBuilderState>();

          return FormBuilder(
            key: _fbKey,
            initialValue: formValues,
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
                  placeHolder: "Price Per Day (RM)",
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
                    initialValue: initialImage,
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
          );
        },
      ),
    );
  }

  _updateProduct(context, productId, formValues) async {
    Map<String, dynamic> formValue = {...formValues};
    showDialog(
      context: context,
      builder: (_) => const D4uLoadingDialog(),
    );
    formValue[UploadServiceConstant.servicePrice] =
        double.parse(formValue[UploadServiceConstant.servicePrice]);
    List newImages = formValue[UploadServiceConstant.servicePictures];
    List xfiles =
        newImages.where((element) => !initialImage.contains(element)).toList();
    List<String> images = [];
    if (xfiles.isNotEmpty) {
      for (var xfile in xfiles) {
        String? url = await UploadService.uploadImage(xfile);
        images.add(url);
      }
    }
    formValue[UploadServiceConstant.servicePictures] = [
      ...initialImage,
      ...images
    ];

    await ProductService.updateProduct(productId, formValue).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  _showDialog(BuildContext context, String? productId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                await ProductService.deleteProduct(productId).then(
                  (value) => Navigator.pop(context),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
