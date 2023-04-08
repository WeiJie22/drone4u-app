import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/filter_constant.dart';
import 'package:flutter/material.dart';

class FilterType {
  static const String categories = 'categories';
  static const String locations = 'locations';
  static const String brand = 'brand';
}

class D4uCatalogFilterPage extends StatefulWidget {
  const D4uCatalogFilterPage({super.key});

  @override
  State<D4uCatalogFilterPage> createState() => D4uCatalogFilterPageState();
}

class D4uCatalogFilterPageState extends State<D4uCatalogFilterPage> {
  Map<String, List<String>> filters = {
    FilterType.categories: [],
    FilterType.locations: [],
    FilterType.brand: [],
  };

  bool isSelected(String filterType, String value) {
    return filters[filterType]?.contains(value) ?? false;
  }

  updateFilterState(bool? currentValue, String filterType, String value) {
    setState(() {
      if (currentValue == true) {
        filters[filterType]!.add(value);
      } else {
        filters[filterType]!.remove(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      appBarTitle: 'Filter',
      showBackButton: true,
      pinAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSection(FilterType.categories, categoriesFilterModel),
            _buildFilterSection(FilterType.locations, locationsFilterModel),
            _buildFilterSection(FilterType.brand, brandFilterModel),
          ],
        ),
      ),
      bottomNavigationBarWidget: D4uSingleButton(
        elevation: true,
        padding: D4uPadding.a16,
        onPressed: () {
          print(
            'filters: $filters',
          );
        },
        text: "Save",
      ),
    );
  }

  _buildFilterSection(String sectionTitle, List<FilterModel> modelList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        D4uText(
          padding: D4uPadding.containerCenter4,
          text: sectionTitle.toTitleCase(),
          textStyle: D4uTextStyle.h1,
        ),
        ListView.builder(
          primary: false,
          padding: D4uPadding.zero,
          itemCount: modelList.length,
          shrinkWrap: true,
          itemBuilder: (context, idx) {
            return Container(
              padding: D4uPadding.containerCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: D4uText(
                          text: modelList[idx].name,
                        ),
                      ),
                      Checkbox(
                        value: isSelected(sectionTitle, modelList[idx].value),
                        onChanged: (currentValue) => updateFilterState(
                          currentValue,
                          sectionTitle,
                          modelList[idx].value,
                        ),
                        activeColor: d4uPrimaryColor,
                      )
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  )
                ],
              ),
            );
          },
        ),
        D4uSizedBox.h16,
      ],
    );
  }
}
