
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../services/domain/entity/add_service_entity.dart';
import '../entity/booking_entity.dart';
import '../repository/booking_repository.dart';
import '../request/book_request.dart';


class BookingUsUseCase implements UseCase<BookingEntity, BookingParams> {
  final BookingRepository _repository;

  BookingUsUseCase(this._repository);

  @override
  Future<Result<BaseError, BookingEntity>> call(BookingParams params) {
    return _repository.saveBooking(bookRequest: params.data);
  }
}


class BookingParams extends BaseParams{
  final BookRequest data;

  BookingParams({required super.cancelToken, required this.data});

}