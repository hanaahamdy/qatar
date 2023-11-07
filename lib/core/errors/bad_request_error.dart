import './http_error.dart';

class BadRequestError extends HttpError {
  final String message;

  BadRequestError({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
