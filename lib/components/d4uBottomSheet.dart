import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uBottomSheet extends StatefulWidget {
  D4uBottomSheet({
    Key? key,
    required this.price,
    this.isNeededMoreThanOneDay = false,
  }) : super(key: key);

  double price;
  bool isNeededMoreThanOneDay;

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
          builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                                borderRadius: BorderRadius.circular(10),
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
                      D4uTextField(
                        name: BookNowConstant.startDate,
                        placeHolder: "Start Date",
                        enabled: false,
                        validator: FormBuilderValidators.required(),
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: widget.isNeededMoreThanOneDay,
                            activeColor: d4uPrimaryColor,
                            onChanged: (value) {
                              setState(
                                () {
                                  widget.isNeededMoreThanOneDay = value!;
                                },
                              );
                            },
                          ),
                          D4uText(
                            text: "I need this service for more than one day",
                            fontSize: 16,
                            color: d4uGray,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      D4uTextField(
                        name: BookNowConstant.endDate,
                        placeHolder: "End Date",
                        enabled: false,
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month_outlined),
                        ),
                        validator: FormBuilderValidators.required(),
                      ),
                      D4uText(
                        text:
                            "Write down your preferred location for the above service",
                        fontSize: 16,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        fontWeight: FontWeight.bold,
                      ),
                      D4uTextField(
                        name: BookNowConstant.location,
                        placeHolder: "Location",
                        validator: FormBuilderValidators.required(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          D4uText(
                            text: "Total Price",
                            fontSize: 16,
                            padding: D4uPadding.a16,
                            fontWeight: FontWeight.bold,
                          ),
                          D4uText(
                            text: 'RM${widget.price.toStringAsFixed(2)}',
                            fontSize: 16,
                            color: Colors.green,
                            padding: D4uPadding.a16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      D4uSingleButton(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        text: 'CONFIRM BOOKING',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    );
  }
}
