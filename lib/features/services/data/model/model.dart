// class GenericClassModel {
//   bool? success;
//   Data? data;
//   String? message;
//
//   GenericClassModel({this.success, this.data, this.message});
//
//   GenericClassModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   int? userId;
//   int? categoryId;
//   int? cityId;
//   int? serviceId;
//   User? user;
//   Category? category;
//   Null? city;
//   Service? service;
//   String? title;
//   String? description;
//   String? logo;
//   String? address;
//   String? lat;
//   String? lng;
//   String? phone;
//   String? email;
//   String? whatsapp;
//   String? website;
//   String? facebook;
//   String? twitter;
//   String? linkedin;
//   String? youtube;
//   String? instagram;
//   int? active;
//   int? views;
//   List? serviceCustomFields;
//   List<Gallery>? gallery;
//   List? files;
//   String? createdAt;
//   String? updatedAt;
//   int? isFavourite;
//
//   Data(
//       {this.id,
//         this.userId,
//         this.categoryId,
//         this.cityId,
//         this.serviceId,
//         this.user,
//         this.category,
//         this.city,
//         this.service,
//         this.title,
//         this.description,
//         this.logo,
//         this.address,
//         this.lat,
//         this.lng,
//         this.phone,
//         this.email,
//         this.whatsapp,
//         this.website,
//         this.facebook,
//         this.twitter,
//         this.linkedin,
//         this.youtube,
//         this.instagram,
//         this.active,
//         this.views,
//         this.serviceCustomFields,
//         this.gallery,
//         this.files,
//         this.createdAt,
//         this.updatedAt,
//         this.isFavourite});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     categoryId = json['category_id'];
//     cityId = json['city_id'];
//     serviceId = json['service_id'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     city = json['city'];
//     service =
//     json['service'] != null ? new Service.fromJson(json['service']) : null;
//     title = json['title'];
//     description = json['description'];
//     logo = json['logo'];
//     address = json['address'];
//     lat = json['lat'];
//     lng = json['lng'];
//     phone = json['phone'];
//     email = json['email'];
//     whatsapp = json['whatsapp'];
//     website = json['website'];
//     facebook = json['facebook'];
//     twitter = json['twitter'];
//     linkedin = json['linkedin'];
//     youtube = json['youtube'];
//     instagram = json['instagram'];
//     active = json['active'];
//     views = json['views'];
//     if (json['service_custom_fields'] != null) {
//       serviceCustomFields = <Null>[];
//       json['service_custom_fields'].forEach((v) {
//         serviceCustomFields!.add(v);
//       });
//     }
//     if (json['gallery'] != null) {
//       gallery = <Gallery>[];
//       json['gallery'].forEach((v) {
//         gallery!.add(new Gallery.fromJson(v));
//       });
//     }
//     if (json['files'] != null) {
//       files = <Null>[];
//       json['files'].forEach((v) {
//         files!.add(v);
//       });
//     }
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isFavourite = json['is_favourite'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['category_id'] = this.categoryId;
//     data['city_id'] = this.cityId;
//     data['service_id'] = this.serviceId;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     data['city'] = this.city;
//     if (this.service != null) {
//       data['service'] = this.service!.toJson();
//     }
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['logo'] = this.logo;
//     data['address'] = this.address;
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['whatsapp'] = this.whatsapp;
//     data['website'] = this.website;
//     data['facebook'] = this.facebook;
//     data['twitter'] = this.twitter;
//     data['linkedin'] = this.linkedin;
//     data['youtube'] = this.youtube;
//     data['instagram'] = this.instagram;
//     data['active'] = this.active;
//     data['views'] = this.views;
//     if (this.serviceCustomFields != null) {
//       data['service_custom_fields'] =
//           this.serviceCustomFields!.map((v) => v.toJson()).toList();
//     }
//     if (this.gallery != null) {
//       data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
//     }
//     if (this.files != null) {
//       data['files'] = this.files!.map((v) => v.toJson()).toList();
//     }
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['is_favourite'] = this.isFavourite;
//     return data;
//   }
// }
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//
//   User({this.id, this.name, this.email, this.phone});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
//
// class Category {
//   int? id;
//   int? serviceId;
//   String? name;
//
//   Category({this.id, this.serviceId, this.name});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     serviceId = json['service_id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['service_id'] = this.serviceId;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class Service {
//   int? id;
//   String? name;
//   String? icon;
//   int? sort;
//   bool? active;
//   int? adsCount;
//
//   Service(
//       {this.id, this.name, this.icon, this.sort, this.active, this.adsCount});
//
//   Service.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     icon = json['icon'];
//     sort = json['sort'];
//     active = json['active'];
//     adsCount = json['ads_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['icon'] = this.icon;
//     data['sort'] = this.sort;
//     data['active'] = this.active;
//     data['ads_count'] = this.adsCount;
//     return data;
//   }
// }
//
// class Gallery {
//   String? name;
//   String? file;
//   String? mimeType;
//   String? fileType;
//   int? adId;
//   String? createdAt;
//   String? updatedAt;
//   int? id;
//
//   Gallery(
//       {this.name,
//         this.file,
//         this.mimeType,
//         this.fileType,
//         this.adId,
//         this.createdAt,
//         this.updatedAt,
//         this.id});
//
//   Gallery.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     file = json['file'];
//     mimeType = json['mime_type'];
//     fileType = json['file_type'];
//     adId = json['ad_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['file'] = this.file;
//     data['mime_type'] = this.mimeType;
//     data['file_type'] = this.fileType;
//     data['ad_id'] = this.adId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['id'] = this.id;
//     return data;
//   }
// }
