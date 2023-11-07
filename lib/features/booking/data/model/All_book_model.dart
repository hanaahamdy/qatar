
class AllBookModel {
  AllBookModel({
      this.id, 
      this.userId, 
      this.user, 
      this.adId, 
      this.ad, 
      this.bookingDate, 
      this.persons, 
      this.comment, 
      this.createdAt, 
      this.updatedAt,});

  AllBookModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    adId = json['ad_id'];
    ad = json['ad'] != null ? Ad.fromJson(json['ad']) : null;
    bookingDate = json['booking_date'];
    persons = json['persons'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  User? user;
  int? adId;
  Ad? ad;
  String? bookingDate;
  String? persons;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['ad_id'] = adId;
    if (ad != null) {
      map['ad'] = ad!.toJson();
    }
    map['booking_date'] = bookingDate;
    map['persons'] = persons;
    map['comment'] = comment;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}
class Ad {
  Ad({
    this.id,

    this.userId,
    this.categoryId,
    this.cityId,
    this.serviceId,
    this.user,
    this.category,
    this.city,
    this.service,
    this.title,
    this.logo,
    this.address,
    this.lat,
    this.linkedin,
    this.lng,
    this.phone,
    this.website,
    this.youtube,
    this.instagram,
    this.twitter,
    this.facebook,
    this.email,
    this.whatsapp,
    this.active,
    this.views,
    this.serviceCustomFields,
    this.createdAt,
    this.updatedAt,
    this.isFavourite,});

  Ad.fromJson(dynamic json) {
    id = json['id'];
    linkedin=json["linkedin"];
    youtube=json["youtube"];
    facebook=json["facebook"];
    twitter=json["twitter"];
    instagram = json["istagram"];
    website=json["website"];

    userId = json['user_id'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    serviceId = json['service_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    title = json['title'];
    logo = json['logo'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
     email = json['email'];
    whatsapp = json['whatsapp'];

    active = json['active'];
    views = json['views'];
    if (json['service_custom_fields'] != null) {
      serviceCustomFields = [];
      json['service_custom_fields'].forEach((v) {
      //  serviceCustomFields!.add(Dynamic.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavourite = json['is_favourite'];
  }
  int? id;
  int? userId;
  int? categoryId;
  int? cityId;
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
  String?linkedin;
  String?youtube;
  String?facebook;
  String?website;
  String?instagram;
  String?twitter;
  dynamic email;
  String? whatsapp;
  int? active;
  int? views;
  List<dynamic>? serviceCustomFields;
  String? createdAt;
  String? updatedAt;
  int? isFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['category_id'] = categoryId;
    map['city_id'] = cityId;
    map['service_id'] = serviceId;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (category != null) {
      map['category'] = category!.toJson();
    }
    if (city != null) {
      map['city'] = city!.toJson();
    }
    if (service != null) {
      map['service'] = service!.toJson();
    }
    map['title'] = title;
    map['logo'] = logo;
    map['address'] = address;
    map['lat'] = lat;
    map['lng'] = lng;
    map['phone'] = phone;
    map['email'] = email;
    map['whatsapp'] = whatsapp;
    map['active'] = active;
    map['linkedin'] = linkedin;
    map["youtube"]=youtube;
    map["facebook"]=facebook;
    map["twitter"]=twitter;
    map["istagram"]=instagram;
    map["website"]=website;
    map['views'] = views;
    if (serviceCustomFields != null) {
      map['service_custom_fields'] = serviceCustomFields!.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_favourite'] = isFavourite;
    return map;
  }

}

class Category {
  Category({
    this.id,
    this.serviceId,
    this.name,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    serviceId = json['service_id'];
    name = json['name'];
  }
  int? id;
  int? serviceId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_id'] = serviceId;
    map['name'] = name;
    return map;
  }

}

class City {
  City({
    this.id,
    this.name,
    this.countryId,
    this.country,});

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
  }
  int? id;
  String? name;
  int? countryId;
  Country? country;

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
class Country {
  Country({
    this.id,
    this.name,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
class Service {
  Service({
    this.id,
    this.name,
    this.icon,
    this.sort,
    this.active,
    this.adsCount,});

  Service.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    sort = json['sort'];
    active = json['active'];
    adsCount = json['ads_count'];
  }
  int? id;
  String? name;
  String? icon;
  int? sort;
  bool? active;
  int? adsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['sort'] = sort;
    map['active'] = active;
    map['ads_count'] = adsCount;
    return map;
  }

}
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}