

import '../../../../core/entities/base_entity.dart';

class BookingEntity extends BaseEntity{

  final int? id;
  final int? userId;
  final adId;
  final String? bookingDate;
  final String? persons;

  BookingEntity({
    this.id,
    this.userId,
    this.adId,
    this.bookingDate,
    this.persons
});

  @override
  List<Object?> get props => [
    id,
    userId,
    adId,
    bookingDate,
    persons
  ];


}