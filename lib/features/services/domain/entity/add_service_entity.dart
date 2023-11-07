


import '../../../../core/entities/base_entity.dart';
import '../../data/model/add_service_model.dart';
import '../../data/model/custom_filel_model.dart';
import 'custom_field_entity.dart';

class AddServiceEntity extends BaseEntity{
  int? id;
  int? userId;
  int? categoryId;
  int? cityId;
  int? serviceId;
  String?linkedin;
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
  int? active;
  int? views;
  String? instagram;

  String? twitter;
  String? website;
  String? youtube;
  String? facebook;
  //ServiceData? serviceData;
  String? createdAt;
  String? updatedAt;
  String? bidDate;
  String? insurancePrice;
  String? termsPrice;
  List<CustomFieldModel>? serviceCustomData;
  int? is_favourite;
  AddServiceEntity({
    this.is_favourite,
    this.serviceCustomData,
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
    this.lat,
    this.lng,
    this.phone,
    this.email,
    this.whatsapp,
    this.active,
    this.linkedin,
    this.views,
    //this.serviceData,
    this.createdAt,
    this.updatedAt,
    this.bidDate,
    this.insurancePrice,
    this.termsPrice});


  @override
  List<Object?> get props => [
    insurancePrice,
    bidDate,
    termsPrice,
    title,
    address,
   // serviceData,
    logo,
   serviceCustomData,
    lat,
    lng
  ];

}