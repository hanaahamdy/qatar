
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/booking_entity.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends BaseModel<BookingEntity>{

  final int? id;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "ad_id")
  final int? adId;
  @JsonKey(name: "booking_date")
  final String? bookingDate;
  final String? persons;

  BookingModel({
    this.id,
    this.userId,
    this.adId,
    this.bookingDate,
    this.persons
  });


  factory  BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  @override
  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      userId: userId,
      adId: adId,
      bookingDate: bookingDate,
      persons: persons
    );
  }

}