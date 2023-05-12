import 'package:drone4u/components/d4u_alert_dialog.dart';
import 'package:drone4u/constant/carousel_image_constant.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/constant/review_constant.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/booking.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/screens/d4u_confirm_booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';

class D4uServiceDetailPageArgs {
  D4uServiceDetailPageArgs({this.product});

  Product? product;
}

class D4uServiceDetailPage extends StatefulWidget {
  D4uServiceDetailPage({
    this.args,
    super.key,
  });

  D4uServiceDetailPageArgs? args;
  @override
  State<D4uServiceDetailPage> createState() => _D4uServiceDetailPageState();
}

class _D4uServiceDetailPageState extends State<D4uServiceDetailPage> {
  late DateTime? _startDate = DateTime.now();
  late DateTime? _endDate = DateTime.now();
  bool _moreThanOneDay = false;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Product product = widget.args?.product ?? Product();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: D4uBottomSheet(
        elevation: true,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 6,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                              ),
                              D4uText(
                                text: 'Book Now',
                                fontWeight: FontWeight.bold,
                                padding: D4uPadding.a16,
                                fontSize: 28,
                              ),
                              const SizedBox(
                                height: 18,
                              )
                            ],
                          ),
                        ),
                        D4uText(
                          text: 'Choose your date',
                          fontWeight: FontWeight.bold,
                          padding: D4uPadding.h16,
                          fontSize: 18,
                        ),
                        D4uDateTimePicker(
                          name: BookNowConstant.startDate,
                          firstDate: DateTime.now(),
                          placeHolder: "Start Date",
                          validator: FormBuilderValidators.required(),
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                          onChanged: (val) {
                            setState(() {
                              _startDate = val;
                            });
                          },
                        ),
                        _buildCheckbox(setState),
                        D4uDateTimePicker(
                          visible: _moreThanOneDay,
                          onChanged: (val) {
                            setState(() {
                              _endDate = val;
                            });
                          },
                          name: BookNowConstant.endDate,
                          firstDate: DateTime.now(),
                          placeHolder: "End Date",
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                          validator: (val) {
                            if (val != null) {
                              if (_startDate!.compareTo(val) == 0) {
                                return 'You cannot choose the same date';
                              }
                              if (_startDate?.isAfter(val) ?? false) {
                                return 'Please choose the date after your starting date';
                              }
                            }
                            if (_moreThanOneDay && val == null) {
                              return 'Please choose your service end date';
                            }
                            return null;
                          },
                        ),
                        D4uText(
                          text:
                              "Write down your preferred location for the above service",
                          fontSize: 16,
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          fontWeight: FontWeight.bold,
                        ),
                        D4uTextField(
                          onChanged: (_) {},
                          name: BookNowConstant.location,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          placeHolder: "Location",
                          alignLabelWithHint: true,
                          validator: FormBuilderValidators.required(),
                        ),
                        _buildTotalPriceSection(product),
                        D4uSingleButton(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          text: 'CONFIRM BOOKING',
                          onPressed: () {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              Map<String, dynamic> formValues = {
                                ..._formKey.currentState?.value ?? {}
                              };
                              formValues['totalPrice'] =
                                  _calculateTotalPrice(product.price);
                              formValues['bookingId'] = const Uuid().v4();
                              if (formValues[BookNowConstant.endDate] == null) {
                                formValues[BookNowConstant.endDate] =
                                    formValues[BookNowConstant.startDate];
                              }
                              Navigator.popAndPushNamed(
                                context,
                                RouteName.confirmBookingPage,
                                arguments: D4uConfirmBookingPageArgs(
                                  product: product,
                                  formValues: Booking.fromJson(formValues),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            D4uSliverAppBar(
              appBarTitle: product.name ?? "Unidentified Product",
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              _buildProductInformation(product),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTotalPriceSection(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        D4uText(
          text: "Total Price",
          fontSize: 16,
          padding: D4uPadding.a16,
          fontWeight: FontWeight.bold,
        ),
        D4uText(
          text: 'RM${_calculateTotalPrice(product.price).toStringAsFixed(2)}',
          fontSize: 16,
          color: Colors.green,
          padding: D4uPadding.a16,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  _calculateTotalPrice(double? price) {
    if (_moreThanOneDay) {
      if (_startDate != null && _endDate != null) {
        return price! * (_endDate!.difference(_startDate!).inDays + 1);
      }
    }
    return price;
  }

  Row _buildCheckbox(StateSetter setState) {
    return Row(
      children: [
        Padding(
          padding: D4uPadding.l8,
          child: SizedBox(
            height: 32.0,
            width: 32.0,
            child: Checkbox(
              value: _moreThanOneDay,
              activeColor: d4uPrimaryColor,
              onChanged: (value) {
                setState(
                  () {
                    _moreThanOneDay = value!;
                    if (!_moreThanOneDay) {
                      _endDate = null;
                      _formKey.currentState?.fields[BookNowConstant.endDate]
                          ?.didChange(null);
                    }
                  },
                );
              },
            ),
          ),
        ),
        D4uText(
          text: "I need this service for more than one day",
          fontSize: 14,
          color: d4uGray,
        ),
      ],
    );
  }

  Widget _buildProductInformation(Product product) {
    return Column(
      children: [
        D4uCarouselImageList(carouselImageList: product.images ?? []),
        D4uServiceDetail(
          productName: product.name,
          price: product.price,
          sellerName: product.sellerName,
          sellerImage: 'assets/d4uDrone_road.jpg',
          productDescription: product.description,
        ),
        D4uReviewTitle(
          review: 86,
          rating: 4.6,
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reviewList.length,
            itemBuilder: (context, index) {
              return reviewList[index];
            },
          ),
        ),
      ],
    );
  }
}
