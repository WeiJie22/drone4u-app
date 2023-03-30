import 'package:drone4u/components/d4uAlertDialog.dart';
import 'package:drone4u/constant/carouselImageConstant.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:drone4u/constant/reviewConstant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uServiceDetailPageArgs {
  D4uServiceDetailPageArgs({this.productName});

  String? productName;
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
  bool _moreThanOneDay = false;
  double price = 150;
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    BookNowConstant.endDate: '',
    BookNowConstant.startDate: '',
    BookNowConstant.location: '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            D4uSliverAppBar(
              appBarTitle: widget.args?.productName ?? "Unidentified Product",
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              D4uCarouselImageList(carouselImageList: carouselImageConstant),
              D4uServiceDetail(
                productName: 'Drone 1',
                price: 450,
                sellerName: 'Shop Larson Electronic',
                sellerImage: 'assets/d4uDrone_road.jpg',
                productDescription:
                    'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. \n\n The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ',
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
              FormBuilder(
                key: _formKey,
                initialValue: formValues,
                child: D4uBottomSheet(
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      D4uText(
                                        text: 'Book Now',
                                        fontWeight: FontWeight.bold,
                                        padding: D4uPadding.a16,
                                        fontSize: 32,
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
                                  suffixIcon:
                                      const Icon(Icons.calendar_month_outlined),
                                  onChanged: (val) {
                                    setState(() {
                                      _startDate = val;
                                    });
                                  },
                                ),
                                Row(
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
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    D4uText(
                                      text:
                                          "I need this service for more than one day",
                                      fontSize: 14,
                                      color: d4uGray,
                                    ),
                                  ],
                                ),
                                D4uDateTimePicker(
                                  visible: _moreThanOneDay,
                                  onChanged: (val) {},
                                  name: BookNowConstant.endDate,
                                  firstDate: DateTime.now(),
                                  placeHolder: "End Date",
                                  suffixIcon:
                                      const Icon(Icons.calendar_month_outlined),
                                  validator: (val) {
                                    if (_startDate
                                            ?.isAfter(val ?? DateTime.now()) ??
                                        false) {
                                      return 'Please choose the date after your starting date';
                                    }
                                    return null;
                                  },
                                ),
                                D4uText(
                                  text:
                                      "Write down your preferred location for the above service",
                                  fontSize: 16,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                                D4uTextField(
                                  name: BookNowConstant.location,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  placeHolder: "Location",
                                  alignLabelWithHint: true,
                                  validator: FormBuilderValidators.required(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    D4uText(
                                      text: "Total Price",
                                      fontSize: 16,
                                      padding: D4uPadding.a16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    D4uText(
                                      text: 'RM${price.toStringAsFixed(2)}',
                                      fontSize: 16,
                                      color: Colors.green,
                                      padding: D4uPadding.a16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                D4uSingleButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 24),
                                  text: 'CONFIRM BOOKING',
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => D4uAlertDialog(
                                        contentTitle: const [
                                          'Service:',
                                          'Seller:',
                                          'Starting Service Date:',
                                          'Ending Service Date:',
                                          'Service Location:',
                                          'Total Price:'
                                        ],
                                        content: const [
                                          'Service A',
                                          'Seller name Here',
                                          '31 Mar 2022',
                                          '2 Apr 2022',
                                          '124, Taman ABC, Jalan 45/2, 12345, Petaling Jaya, Selangor 124, Taman ABC, Jalan 45/2, 12345, Petaling Jaya, Selangor',
                                          'RM150'
                                        ],
                                        primaryCallback: () =>
                                            Navigator.pushNamed(context,
                                                RouteName.successBookingPage,),
                                        secondaryCallback: () =>
                                            Navigator.pop(context),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
