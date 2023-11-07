import './http_error.dart';
import 'base_error.dart';

class UnauthorizedHttpError extends HttpError {
  final String message;

  UnauthorizedHttpError({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
