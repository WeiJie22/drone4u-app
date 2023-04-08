class FilterModel {
  String value;
  String name;
  bool isSelected;

  FilterModel({
    required this.value,
    required this.name,
    this.isSelected = false,
  });
}

List<FilterModel> categoriesFilterModel = [
  FilterModel(value: 'category1', name: 'This is category1'),
  FilterModel(value: 'category2', name: 'This is category2'),
  FilterModel(value: 'category3', name: 'This is category3'),
  FilterModel(value: 'category4', name: 'This is category4'),
];

List<FilterModel> locationsFilterModel = [
  FilterModel(value: 'location1', name: 'This is location1'),
  FilterModel(value: 'location2', name: 'This is location2'),
  FilterModel(value: 'location3', name: 'This is location3'),
];

List<FilterModel> brandFilterModel = [
  FilterModel(value: 'brand1', name: 'This is brand1'),
  FilterModel(value: 'brand2', name: 'This is brand2'),
  FilterModel(value: 'brand3', name: 'This is brand3'),
  FilterModel(value: 'brand4', name: 'This is brand4'),
];
