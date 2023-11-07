import 'base_error.dart';

class AccountNotVerifiedError extends BaseError {
  AccountNotVerifiedError({required super.message});

  @override
  List<Object> get props => [];
}
