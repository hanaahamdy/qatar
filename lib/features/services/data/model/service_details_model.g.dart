// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDetailsModel _$ServiceDetailsModelFromJson(Map<String, dynamic> json) =>
    ServiceDetailsModel(
      id: json['id'] as int?,
      isFavorite: json['is_favourite'] as int?,
      serviceCustomData: (json['service_custom_fields'] as List<dynamic>)
          .map((e) => CustomFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['userId'] as int?,
      categoryId: json['categoryId'] as int?,
      cityId: json['cityId'] as int?,
      serviceId: json['serviceId'] as int?,
      user: json['user'] == null ? null : User.fromJson(json['user']),
      category:
          json['category'] == null ? null : Category.fromJson(json['category']),
      city: json['city'] == null ? null : City.fromJson(json['city']),
      service:
          json['service'] == null ? null : Service.fromJson(json['service']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      facebook: json['facebook'] as String?,
      youtube: json['youtube'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      website: json['website'] as String?,
      whatsapp: json['whatsapp'] as String?,
      active: json['active'] as int?,
      views: json['views'] as int?,
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Files.fromJson(e))
          .toList(),
      linkedin: json['linkedin'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bidDate: json['bid_date'] as String?,
      insurancePrice: json['insurance_price'] as String?,
      termsPrice: json['terms_price'] as String?,
    );

Map<String, dynamic> _$ServiceDetailsModelToJson(
        ServiceDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'linkedin': instance.linkedin,
      'cityId': instance.cityId,
      'serviceId': instance.serviceId,
      'user': instance.user,
      'category': instance.category,
      'city': instance.city,
      'service': instance.service,
      'title': instance.title,
      'description': instance.description,
      'logo': instance.logo,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'email': instance.email,
      'whatsapp': instance.whatsapp,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'website': instance.website,
      'youtube': instance.youtube,
      'facebook': instance.facebook,
      'active': instance.active,
      'views': instance.views,
      'gallery': instance.gallery,
      'files': instance.files,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bid_date': instance.bidDate,
      'insurance_price': instance.insurancePrice,
      'terms_price': instance.termsPrice,
      'is_favourite': instance.isFavorite,
      'service_custom_fields': instance.serviceCustomData,
    };
