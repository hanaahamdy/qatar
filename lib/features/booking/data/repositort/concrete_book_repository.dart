

import '../../../../core/errors/base_error.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../../domain/request/book_request.dart';
import '../datasource/booking_remote_datasource.dart';
import '../model/booking_model.dart';

class ConcreteBookRepository extends BookingRepository{

  final BookingRemoteDataSource remoteDataSource;

  ConcreteBookRepository(this.remoteDataSource);

  @override
  Future<Result<BaseError, BookingEntity>> saveBooking({BookRequest? bookRequest}) async{
    final remoteResult =await remoteDataSource.saveBooking(bookRequest: bookRequest!);
    return execute<BookingModel, BookingEntity>(remoteResult: remoteResult);
  }

}