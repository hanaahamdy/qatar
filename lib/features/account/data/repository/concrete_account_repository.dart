


import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/models/empty_model.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/about_entity.dart';
import '../../domain/entity/contact_entity.dart';
import '../../domain/entity/settings_entity.dart';
import '../../domain/repository/account_repository.dart';
import '../datasource/account_datasource.dart';
import '../model/about_model.dart';
import '../model/contact_model.dart';
import '../model/settings_model.dart';
import '../requests/archive_request.dart';
import '../requests/contact_request.dart';

class ConcreteAccountRepository extends AccountRepository{

  final AccountRemoteDataSource remoteDataSource;

  ConcreteAccountRepository(this.remoteDataSource);

  @override
  Future<Result<BaseError, ContactEntity>> contactUs(ContactRequest contactRequest) async{
    final remoteResult =await remoteDataSource.contactUs(contactRequest: contactRequest);
    return execute<ContactModel, ContactEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, AboutEntity>> getAbout() async{
    final remoteResult =await remoteDataSource.aboutUs();
    return execute<AboutModel, AboutEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, AboutEntity>> getConditions() async{
    final remoteResult =await remoteDataSource.conditions();
    return execute<AboutModel, AboutEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<SettingsEntity>>> getSettings() async{
    final remoteResult =await remoteDataSource.getSettings();
    return executeForList<SettingsModel, SettingsEntity>(remoteResult: remoteResult);
  }


  @override
  Future<Result<BaseError, EmptyEntity>> logout() async{
    final remoteResult =await remoteDataSource.logout();
    return execute<EmptyModel, EmptyEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, Object>> deleteAccount() async{
    final remoteResult =await remoteDataSource.deleteAccount();
    return executeForNoData(remoteResult: remoteResult);
  }






}