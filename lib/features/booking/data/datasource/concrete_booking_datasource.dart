

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';
import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/http/http_method.dart';
import '../../domain/request/book_request.dart';
import '../model/booking_model.dart';
import '../response/booking_response.dart';
import 'booking_remote_datasource.dart';

class ConcreteBookingRemoteDataSource  extends BookingRemoteDataSource{

  @override
  Future<Either<BaseError, BookingModel>> saveBooking({BookRequest? bookRequest}) {
    return requestMessage<BookingModel, BookingResposne>(
      responseStr: 'BookingResposne',
      converter: (json) => BookingResposne.fromJson(json),
      method: HttpMethod.POST,
      data: {
        'booking_date': bookRequest!.bookingDate,
        'persons': bookRequest.persons,
        'comment': bookRequest.comment,
        'ad_id': bookRequest.adId,
      },
      url: API_BOOKING,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

}