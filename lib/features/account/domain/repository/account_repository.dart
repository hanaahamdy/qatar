

import 'package:dartz/dartz.dart';

import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../../services/data/model/services_model.dart';
import '../../../services/domain/entity/categories_service_entity.dart';
import '../../data/requests/archive_request.dart';
import '../../data/requests/contact_request.dart';
import '../entity/about_entity.dart';
import '../entity/contact_entity.dart';
import '../entity/settings_entity.dart';

abstract class AccountRepository extends Repository{

  Future<Result<BaseError, ContactEntity>> contactUs(ContactRequest contactRequest);
  Future<Result<BaseError,AboutEntity>> getConditions();
  Future<Result<BaseError,AboutEntity>> getAbout();
  Future<Result<BaseError, List<SettingsEntity>>> getSettings();
  Future<Result<BaseError,EmptyEntity>> logout();
  Future<Result<BaseError,Object>> deleteAccount();
}