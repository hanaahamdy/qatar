import './http_error.dart';

class ConflictError extends HttpError {
  ConflictError({required super.message});
}
