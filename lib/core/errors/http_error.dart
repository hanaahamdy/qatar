import './base_error.dart';

class HttpError extends BaseError {
  HttpError({required super.message});

  @override
  List<Object> get props => [];
}
