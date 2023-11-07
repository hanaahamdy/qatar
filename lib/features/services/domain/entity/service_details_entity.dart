import 'package:json_annotation/json_annotation.dart';

import '../../../../core/entities/base_entity.dart';
import '../../data/model/add_service_model.dart';
import '../../data/model/custom_filel_model.dart';
import '../../data/model/service_details_model.dart';

class ServiceDetailsEntity extends BaseEntity{

  int? id;
  int? isFavourite;
  int? userId;
  int? categoryId;
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
  String? youtube;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? website;

  int? active;
  int? views;
  ServiceData? serviceData;
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
  List<CustomFieldModel>? serviceCustomData;

  ServiceDetailsEntity({
    this.id,
    required this.serviceCustomData,
    required this.isFavourite,
    this.userId,
    this.categoryId,
    this.twitter,
    this.youtube,
    this.linkedin,
    this.website,
    this.facebook,
    this.instagram,
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
    this.whatsapp,
    this.active,
    this.views,
    this.serviceData,
    this.gallery,
    this.files,
    this.createdAt,
    this.updatedAt,
    this.bidDate,
    this.insurancePrice,
    this.termsPrice});

  @override
  List<Object?> get props => [
    id,
    isFavourite,
    title,
    userId,
    logo,
    description,
    serviceId,
    categoryId,
    category,
    createdAt,
    files,
    gallery,
    city,
    cityId,
    serviceData,
    termsPrice,
    insurancePrice,
    bidDate,
    views,
    whatsapp,
    email,
    lat,
    lng,
    phone,
   instagram,
  youtube,
   facebook,
   twitter,
   // linkedin,
   website
  ];

}