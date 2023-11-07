import './connection_error.dart';

class TimeoutError extends ConnectionError {
  TimeoutError({required super.message});
}
