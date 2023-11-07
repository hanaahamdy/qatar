import './http_error.dart';

class NotFoundError extends HttpError {
  NotFoundError({required super.message});
}
