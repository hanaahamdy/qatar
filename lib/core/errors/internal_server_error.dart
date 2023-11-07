import './http_error.dart';

class InternalServerError extends HttpError {
  final String message;

  InternalServerError({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
