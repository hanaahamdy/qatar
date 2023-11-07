

import 'package:dartz/dartz.dart';

import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/models/empty_model.dart';
import '../../../services/data/model/services_model.dart';
import '../model/about_model.dart';
import '../model/contact_model.dart';
import '../model/settings_model.dart';
import '../requests/contact_request.dart';

abstract class AccountRemoteDataSource extends RemoteDataSource{

  Future<Either<BaseError, ContactModel>> contactUs({ContactRequest contactRequest});
  Future<Either<BaseError, AboutModel>> aboutUs();
  Future<Either<BaseError, AboutModel>> conditions();
  Future<Either<BaseError, List<SettingsModel>>> getSettings();
  Future<Either<BaseError, EmptyModel>> logout();
  Future<Either<BaseError, Object>> deleteAccount();

}