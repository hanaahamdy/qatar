
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../services/domain/entity/add_service_entity.dart';
import '../entity/about_entity.dart';
import '../repository/account_repository.dart';


import '../../../../core/usecase/base_usecase.dart';
import '../../../services/domain/entity/add_service_entity.dart';
import '../../data/requests/contact_request.dart';
import '../entity/contact_entity.dart';

class ContactUsUseCase
    implements UseCase<ContactEntity, ContactUsParams> {
  final AccountRepository _repository;

  ContactUsUseCase(this._repository);

  @override
  Future<Result<BaseError, ContactEntity>> call(ContactUsParams params) {
    return _repository.contactUs(params.data);
  }
}


class ContactUsParams extends BaseParams{
  final ContactRequest data;

  ContactUsParams({required super.cancelToken, required this.data});

}