class AddConstructionRequest {

  final int? serviceId;
  final int? categoryId;
  final int? cityId;
  final String? title;
  final String? description;
  final String? logo;

  final String? address;
  final String? lat;
  final String? lng;
  final String? phone;
  final String? email;
  final String? whatsapp;
  final List<String>? file;
  final List<String>? images;

  AddConstructionRequest({
      this.serviceId,
      this.categoryId,
      this.cityId,
      this.title,
      this.description,
      this.logo,
      this.address,
      this.lat,
      this.lng,
      this.phone,
      this.email,
      this.whatsapp,
      this.file,
      this.images});
}