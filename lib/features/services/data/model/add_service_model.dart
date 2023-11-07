import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/add_service_entity.dart';
import 'custom_filel_model.dart';

part 'add_service_model.g.dart';

@JsonSerializable()
class AddServiceModel extends BaseModel<AddServiceEntity> {
  int? id;
  int? userId;
  int? categoryId;
  int? cityId;
  @JsonKey(name: 'service_id')
  int? serviceId;
  User? user;
  Category? category;
  City? city;
  Service? service;
  String? title;
  String? logo;
  String? address;
  String? lat;
  String? lng;
  String? phone;
  String? email;
  String? whatsapp;
  String? instagram;
  String? linkedin;
  String? twitter;
  String? website;
  String? youtube;
  String? facebook;
  int? active;
  int? views;

  // @JsonKey(name: 'service_data')
  // ServiceData? serviceData;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: 'bid_date')
  String? bidDate;
  @JsonKey(name: 'insurance_price')
  String? insurancePrice;
  @JsonKey(name: 'terms_price')
  String? termsPrice;
  @JsonKey(name: 'service_custom_fields')
  List<CustomFieldModel> serviceCustomData;
  int? is_favourite;

  AddServiceModel(
      {required this.is_favourite,
      required this.serviceCustomData,
      this.id,
      this.userId,
      this.categoryId,
      this.cityId,
      this.serviceId,
      this.user,
      this.category,
      this.city,
      this.website,
      this.instagram,
      this.twitter,

      this.youtube,
      this.facebook,
      this.service,
      this.title,
      this.logo,
      this.address,
      this.linkedin,
      this.lat,
      this.lng,
      this.phone,
      this.email,
      this.whatsapp,
      this.active,
      this.views,
      //this.serviceData,
      this.createdAt,
      this.updatedAt,
      this.bidDate,
      this.insurancePrice,
      this.termsPrice});

  factory AddServiceModel.fromJson(Map<String, dynamic> json) =>
      _$AddServiceModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddServiceModelToJson(this);

  @override
  AddServiceEntity toEntity() {
    return AddServiceEntity(
        id: id,
        categoryId: categoryId,
        serviceId: serviceId,
        category: category,
        facebook: facebook,
        youtube: youtube,
        website: website,
        instagram: instagram,
        twitter: twitter,
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
        logo: logo,
        lat: lat,
        lng: lng,
        title: title,
        bidDate: bidDate,
        service: service,
        //  serviceData: serviceData,
        views: views,
        linkedin: linkedin,
        serviceCustomData: serviceCustomData,
        is_favourite: is_favourite);
  }
}

class Service {
  int? id;
  String? name;
  String? icon;
  int? sort;
  bool? active;

  Service({
    this.id,
    this.name,
    this.icon,
    this.sort,
    this.active,
  });

  Service.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    sort = json['sort'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['sort'] = sort;
    map['active'] = active;
    return map;
  }
}

class Country {
  int? id;
  String? name;

  Country({
    this.id,
    this.name,
  });

  Country.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class City {
  int? id;
  String? name;
  int? countryId;
  Country? country;

  City({
    this.id,
    this.name,
    this.countryId,
    this.country,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['country_id'] = countryId;
    if (country != null) {
      map['country'] = country!.toJson();
    }
    return map;
  }
}

// class ServiceData {
//
//
//   String? bidDate;
//   String? insurancePrice;
//   String? termsPrice;
//
//   ServiceData({
//     this.bidDate,
//     this.insurancePrice,
//     this.termsPrice,});
//
//   ServiceData.fromJson(dynamic json) {
//     bidDate = json['bid_date'] ?? '';
//     insurancePrice = json['insurance_price'];
//     termsPrice = json['terms_price'];
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['bid_date'] = bidDate;
//     map['insurance_price'] = insurancePrice;
//     map['terms_price'] = termsPrice;
//     return map;
//   }
//
//}

class Category {
  int? id;
  int? serviceId;
  String? name;

  Category({
    this.id,
    this.serviceId,
    this.name,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    serviceId = json['service_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_id'] = serviceId;
    map['name'] = name;
    return map;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}

// {
// "id": 16,
// "user_id": 1,
// "category_id": 4,
// "city_id": 7,
// "service_id": 1,
// "user": {
// "id": 1,
// "name": "admin",
// "email": "admin@admin.com",
// "phone": "010943002344"
// },
// "category": {
// "id": 4,
// "service_id": 1,
// "name": "توريد"
// },
// "city": {
// "id": 7,
// "name": "بورسعيد",
// "country_id": 1,
// "country": {
// "id": 1,
// "name": "مصر"
// }
// },
// "service": {
// "id": 1,
// "name": "المناقصات",
// "icon": "https://con-forum.com/images/services/166258545363190a6d9ae152.03540437bids.png",
// "sort": 1,
// "active": true
// },
// "title": "إعلان تجريبي 34",
// "logo": "https://con-forum.com/images/ads/1662666553631a473933a869.36102442305695612_5666609193417527_6863937421900378279_n.jpg",
// "address": "مركز الجمالية - شارع البحر",
// "lat": "30.033333",
// "lng": "31.233334",
// "phone": "01013248182",
// "email": "mohamed.arafat.cis@gmail.com",
// "whatsapp": "31.233334",
// "active": 1,
// "views": 255,
// "service_data": {
// "bid_date": "2022-10-30",
// "insurance_price": "10000 جنيه مصري",
// "terms_price": "500 جنيه مصري"
// },
// "created_at": "2022-05-05T19:49:13.000000Z",
// "updated_at": "2022-09-08T19:49:13.000000Z",
// "bid_date": "2022-10-30",
// "insurance_price": "10000 جنيه مصري",
// "terms_price": "500 جنيه مصري"
// }
