
class FilterRequest{
  final int? id;
  final List<int>? categories;
  final String? startDate;
  final String? endDate;
  final int? cityId;

  FilterRequest({this.startDate, this.endDate, this.id, this.categories, this.cityId});
}