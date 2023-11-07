

import '../../../../core/errors/base_error.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../../account/domain/entity/about_entity.dart';
import '../entity/booking_entity.dart';
import '../request/book_request.dart';

abstract class BookingRepository extends Repository{
  Future<Result<BaseError, BookingEntity>> saveBooking({BookRequest? bookRequest});
}