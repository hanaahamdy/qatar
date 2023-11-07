import 'base_error.dart';

class CustomError extends BaseError {
  final String message;

  CustomError({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
