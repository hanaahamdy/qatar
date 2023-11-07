import 'base_error.dart';

class ConnectionError extends BaseError {
  ConnectionError({required super.message});

  @override
  List<Object> get props => [];
}
