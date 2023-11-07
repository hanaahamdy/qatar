
import 'package:dartz/dartz.dart';

import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../domain/request/book_request.dart';
import '../model/booking_model.dart';

abstract class BookingRemoteDataSource extends RemoteDataSource{
  Future<Either<BaseError, BookingModel>> saveBooking({BookRequest bookRequest});
}