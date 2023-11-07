// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddServiceModel _$AddServiceModelFromJson(Map<String, dynamic> json) =>
    AddServiceModel(
      is_favourite: json['is_favourite'] as int?,
      serviceCustomData: (json['service_custom_fields'] as List<dynamic>)
          .map((e) => CustomFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      categoryId: json['categoryId'] as int?,
      cityId: json['cityId'] as int?,
      serviceId: json['service_id'] as int?,
      user: json['user'] == null ? null : User.fromJson(json['user']),
      category:
          json['category'] == null ? null : Category.fromJson(json['category']),
      city: json['city'] == null ? null : City.fromJson(json['city']),
      website: json['website'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      youtube: json['youtube'] as String?,
      facebook: json['facebook'] as String?,
      service:
          json['service'] == null ? null : Service.fromJson(json['service']),
      title: json['title'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
      linkedin: json['linkedin'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      whatsapp: json['whatsapp'] as String?,
      active: json['active'] as int?,
      views: json['views'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bidDate: json['bid_date'] as String?,
      insurancePrice: json['insurance_price'] as String?,
      termsPrice: json['terms_price'] as String?,
    );

Map<String, dynamic> _$AddServiceModelToJson(AddServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'cityId': instance.cityId,
      'service_id': instance.serviceId,
      'user': instance.user,
      'category': instance.category,
      'city': instance.city,
      'service': instance.service,
      'title': instance.title,
      'logo': instance.logo,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'email': instance.email,
      'whatsapp': instance.whatsapp,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'website': instance.website,
      'youtube': instance.youtube,
      'facebook': instance.facebook,
      'active': instance.active,
      'views': instance.views,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bid_date': instance.bidDate,
      'insurance_price': instance.insurancePrice,
      'terms_price': instance.termsPrice,
      'service_custom_fields': instance.serviceCustomData,
      'is_favourite': instance.is_favourite,
    };
