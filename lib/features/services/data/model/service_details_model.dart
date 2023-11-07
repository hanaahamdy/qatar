import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/service_details_entity.dart';
import 'add_service_model.dart';
import 'custom_filel_model.dart';

part 'service_details_model.g.dart';

@JsonSerializable()
class ServiceDetailsModel extends BaseModel<ServiceDetailsEntity> {
  int? id;
  int? userId;
  int? categoryId;
  String? linkedin;
  int? cityId;
  int? serviceId;
  User? user;
  Category? category;
  City? city;
  Service? service;
  String? title;
  String? description;
  String? logo;
  String? address;
  String? lat;
  String? lng;
  String? phone;
  String? email;
  String? whatsapp;
  String? instagram;

  String? twitter;
  String? website;
  String? youtube;
  String? facebook;

  int? active;
  int? views;

  // @JsonKey(name: 'service_data')
  // ServiceData? serviceData;
  List<Gallery>? gallery;
  List<Files>? files;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: 'bid_date')
  String? bidDate;
  @JsonKey(name: 'insurance_price')
  String? insurancePrice;
  @JsonKey(name: 'terms_price')
  String? termsPrice;
  @JsonKey(name: 'is_favourite')
  int? isFavorite;
  @JsonKey(name: 'service_custom_fields')
  List<CustomFieldModel> serviceCustomData;

  ServiceDetailsModel(
      {this.id,
      required this.isFavorite,
      required this.serviceCustomData,
      this.userId,
      this.categoryId,
      this.cityId,
      this.serviceId,
      this.user,
      this.category,
      this.city,
      this.service,
      this.title,
      this.description,
      this.logo,
      this.address,
      this.lat,
      this.lng,
      this.phone,
      this.email,
      this.facebook,
      this.youtube,
      this.twitter,
      this.instagram,
      this.website,
      this.whatsapp,
      this.active,
      this.views,
      this.gallery,
      this.files,
      this.linkedin,
      this.createdAt,
      this.updatedAt,
      this.bidDate,
      this.insurancePrice,
      this.termsPrice});

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsModelFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$ServiceDetailsModelToJson(this);

  @override
  ServiceDetailsEntity toEntity() {
    return ServiceDetailsEntity(
        linkedin: linkedin,
        id: id,
        description: description,
        categoryId: categoryId,
        serviceId: serviceId,
        category: category,
        updatedAt: createdAt,
        user: user,
        active: active,
        address: address,
        termsPrice: termsPrice,
        createdAt: createdAt,
        city: city,
        cityId: cityId,
        insurancePrice: insurancePrice,
        userId: userId,
        email: email,
        phone: phone,
        whatsapp: whatsapp,
        instagram: instagram,
        youtube: youtube,
        twitter: twitter,
        facebook:facebook,
        website: website,
        logo: logo,
        lat: lat,
        lng: lng,
        title: title,
        bidDate: bidDate,
        service: service,
//        serviceData: serviceData,
        views: views,
        gallery: gallery,
        files: files,
        isFavourite: isFavorite,
        serviceCustomData: serviceCustomData);
  }
}

class Files {
  Files({
    this.name,
    this.file,
    this.mimeType,
    this.fileType,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  Files.fromJson(dynamic json) {
    name = json['name'];
    file = json['file'];
    mimeType = json['mime_type'];
    fileType = json['file_type'];
    adId = json['ad_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  String? name;
  String? file;
  String? mimeType;
  String? fileType;
  int? adId;
  String? createdAt;
  String? updatedAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['file'] = file;
    map['mime_type'] = mimeType;
    map['file_type'] = fileType;
    map['ad_id'] = adId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['id'] = id;
    return map;
  }
}

class Gallery {
  Gallery({
    this.name,
    this.file,
    this.mimeType,
    this.fileType,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  Gallery.fromJson(dynamic json) {
    name = json['name'];
    file = json['file'];
    mimeType = json['mime_type'];
    fileType = json['file_type'];
    adId = json['ad_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  String? name;
  String? file;
  String? mimeType;
  String? fileType;
  int? adId;
  String? createdAt;
  String? updatedAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['file'] = file;
    map['mime_type'] = mimeType;
    map['file_type'] = fileType;
    map['ad_id'] = adId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['id'] = id;
    return map;
  }
}

// class Category {
//   Category({
//     this.id,
//     this.serviceId,
//     this.name,});
//
//   Category.fromJson(dynamic json) {
//     id = json['id'];
//     serviceId = json['service_id'];
//     name = json['name'];
//   }
//   int id;
//   int serviceId;
//   String name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['service_id'] = serviceId;
//     map['name'] = name;
//     return map;
//   }
//
// }
// class City {
//   City({
//     this.id,
//     this.name,
//     this.countryId,
//     this.country,});
//
//   City.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     countryId = json['country_id'];
//     country = json['country'] != null ? Country.fromJson(json['country']) : null;
//   }
//   int id;
//   String name;
//   int countryId;
//   Country country;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['country_id'] = countryId;
//     if (country != null) {
//       map['country'] = country.toJson();
//     }
//     return map;
//   }
//
// }
// class Country {
//   Country({
//     this.id,
//     this.name,});
//
//   Country.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//   }
//   int id;
//   String name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     return map;
//   }
//
// }
//
class ServiceData {
  ServiceData({
    this.bidDate,
    this.insurancePrice,
    this.termsPrice,
  });

  ServiceData.fromJson(dynamic json) {
    bidDate = json['bid_date'];
    insurancePrice = json['insurance_price'];
    termsPrice = json['terms_price'];
  }

  String? bidDate;
  String? insurancePrice;
  String? termsPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bid_date'] = bidDate;
    map['insurance_price'] = insurancePrice;
    map['terms_price'] = termsPrice;
    return map;
  }
}
// class User {
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,});
//
//   User.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//   }
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['email'] = email;
//     map['phone'] = phone;
//     return map;
//   }
//
// }
// class Service {
//   Service({
//     this.id,
//     this.name,
//     this.icon,
//     this.sort,
//     this.active,});
//
//   Service.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     icon = json['icon'];
//     sort = json['sort'];
//     active = json['active'];
//   }
//   int? id;
//   String? name;
//   String? icon;
//   int? sort;
//   bool? active;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['icon'] = icon;
//     map['sort'] = sort;
//     map['active'] = active;
//     return map;
//   }
//
// }
