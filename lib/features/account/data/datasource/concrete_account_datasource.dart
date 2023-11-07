

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';
import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/http/http_method.dart';
import '../../../../core/models/empty_model.dart';
import '../../../services/data/api_response/add_service_response.dart';
import '../../../services/data/api_response/categories_service_response.dart';
import '../api_response/about_response.dart';
import '../api_response/contact_us_response.dart';
import '../api_response/settings_response.dart';
import '../model/about_model.dart';
import '../model/contact_model.dart';
import '../model/settings_model.dart';
import '../requests/archive_request.dart';
import '../requests/contact_request.dart';
import 'account_datasource.dart';

class ConcreteAccountDataSource extends AccountRemoteDataSource{

  @override
  Future<Either<BaseError, ContactModel>> contactUs({ContactRequest? contactRequest}) {
    return requestMessage<ContactModel, ContactUsResposne>(
      responseStr: 'ContactUsResposne',
      converter: (json) => ContactUsResposne.fromJson(json),
      method: HttpMethod.POST,
      data: {
        'full_name': contactRequest!.fullName,
        'email': contactRequest.email,
        'phone': contactRequest.phone,
        'subject': contactRequest.subject,
        'message': contactRequest.message
      },
      url: API_CONTACT_US,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, AboutModel>> aboutUs() {
    return requestMessage<AboutModel, AboutResposne>(
      responseStr: 'AboutResposne',
      converter: (json) => AboutResposne.fromJson(json),
      method: HttpMethod.GET,
      url: API_ABOUT_US,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, AboutModel>> conditions() {
    return requestMessage<AboutModel, AboutResposne>(
      responseStr: 'AboutResposne',
      converter: (json) => AboutResposne.fromJson(json),
      method: HttpMethod.GET,
      url: API_TERMS,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }
  @override
  Future<Either<BaseError, List<SettingsModel>>> getSettings() {
    return requestMessage<List<SettingsModel>, SettingsResposne>(
      responseStr: 'SettingsResposne',
      converter: (json) => SettingsResposne.fromJson(json),
      method: HttpMethod.GET,
      url: API_SETTINGS,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }
  @override
  Future<Either<BaseError, EmptyModel>> logout() {
    return requestAuth<EmptyModel, EmptyModel>(
      responseStr: 'EmptyModel',
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_AUTH_LOGOUT,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, Object>> deleteAccount() {
    return requestAuth<EmptyModel, EmptyModel>(
      responseStr: 'EmptyModel',
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_AUTH_DELETE_ACCOUNT,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

}