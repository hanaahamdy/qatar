import './http_error.dart';

class ForbiddenError extends HttpError {
  final String message;

  ForbiddenError({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
