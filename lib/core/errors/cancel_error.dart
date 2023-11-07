import './base_error.dart';

class CancelError extends BaseError {
  CancelError({required super.message});

  @override
  List<Object> get props => [];
}
