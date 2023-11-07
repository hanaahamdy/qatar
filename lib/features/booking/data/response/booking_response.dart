
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/booking_model.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResposne extends MessageApiResponse<BookingModel>{

  BookingResposne(bool success,BookingModel data, String message)
      : super(success, data, message);


  factory BookingResposne.fromJson(Map<String, dynamic> json) =>
      _$BookingResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$BookingResposneToJson(this);

}