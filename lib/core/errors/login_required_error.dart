
import 'base_error.dart';

class LoginRequiredError extends BaseError {

  LoginRequiredError({required super.message});

  @override
  List<Object> get props => [];
}
