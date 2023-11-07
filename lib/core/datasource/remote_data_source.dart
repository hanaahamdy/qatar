import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../appConfig.dart';
import '../constants.dart';
import '../di/di.dart';
import '../errors/account_not_verified_error.dart';
import '../errors/base_error.dart';
import '../errors/custom_error.dart';
import '../errors/login_required_error.dart';
import '../errors/unknown_error.dart';
import '../http/api_provider.dart';
import '../http/http_method.dart';
import '../http/models_factory.dart';
import '../models/base_model.dart';
import '../response/api_response.dart';
import '../response/base_response.dart';
import '../response/message_api_response.dart';
import '../utils/app_prefs.dart';



abstract class RemoteDataSource {

  Future<Either<BaseError, Data>> requestUploadFile<Data, Response extends MessageApiResponse<Data>>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required String url,
    required String logo,
    required String file,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(
      responseStr,
      converter,
    );

    // Specify the headers.
    final Map<String, String> headers = {};
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
    // Get auth token (if withAuthentication)
    if (withAuthentication) {
      if (await locator<AppPreferences>().hasToken) {
        final token = await locator<AppPreferences>().authToken;
        headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
      }
    }

    // Send the api_request.
    final response = await ApiProvider.uploadFile<Response>(
      url: url,
      filePath: file,
      logoPath: logo,
      data: data!,
      queryParameters: queryParameters ?? {},
      headers: headers,
      // onSendProgress: onSendProgress!,
      // onReceiveProgress: onReceiveProgress!,
      cancelToken: cancelToken,
    );

    if (response.isLeft()) {
      return Left((response as Left<BaseError, Response>).value);
    } else if (response.isRight()) {
      final resValue = (response as Right<BaseError, Response>).value;
      if (resValue!=null) {
        return Right(resValue.data!);
      } /*else if (resValue.success != null && !resValue.success) {
        final messageCode = -1;
        switch (messageCode) {
          case MESSAGE_CODE_ACCOUNT_NOT_VERIFIED:
            return Left(AccountNotVerifiedError());
          case MESSAGE_CODE_LOGIN_REQUIRED:
            return Left(LoginRequiredError());
          default:
            return Left(CustomError(message: ''));
        //return Left(CustomError(message: resValue.message));
        }
      }*/
      //return Left(UnknownError());
    }
      return Left(UnknownError(message: 'UnKnown Error'));
  }


  Future<Either<BaseError, Data>> requestUploadFiles<Data, Response extends MessageApiResponse<Data>>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required String url,
    required String? logo,
    required List<String>? files,
    required List<String>? images,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(
      responseStr,
      converter,
    );

    // Specify the headers.
    final Map<String, String> headers = {};
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
    // Get auth token (if withAuthentication)
    if (withAuthentication) {
      if (await locator<AppPreferences>().hasToken) {
        final token = await locator<AppPreferences>().authToken;
        headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
      }
    }

    // Send the api_request.
    final response = await ApiProvider.uploadFiles<Response>(
      url: url,
      filesPath: files,
      imagesPath: images,
      logoPath: logo,
      data: data!,
      queryParameters: queryParameters ?? {},
      headers: headers,
      // onSendProgress: onSendProgress!,
      // onReceiveProgress: onReceiveProgress!,
      cancelToken: cancelToken,
    );

    if (response.isLeft()) {
      return Left((response as Left<BaseError, Response>).value);
    } else if (response.isRight()) {
      final resValue = (response as Right<BaseError, Response>).value;
      if (resValue!=null) {
        return Right(resValue.data!);
      } /*else if (resValue.success != null && !resValue.success) {
        final messageCode = -1;
        switch (messageCode) {
          case MESSAGE_CODE_ACCOUNT_NOT_VERIFIED:
            return Left(AccountNotVerifiedError());
          case MESSAGE_CODE_LOGIN_REQUIRED:
            return Left(LoginRequiredError());
          default:
            return Left(CustomError(message: ''));
        //return Left(CustomError(message: resValue.message));
        }
      }*/
    //  return Left(UnknownError());
    }
    return Left(UnknownError(message: 'UnKnown Error'));
  }

  Future<Either<BaseError, Data>> request<Data, Response extends ApiResponse<Data>>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(responseStr, converter);

    // Specify the headers.
    final Map<String, dynamic> headers = {};

    // Get the language.
    final lang = await appConfig.currentLanguage;

    // headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
    if (withAuthentication) {
      if (await locator<AppPreferences>().hasToken) {
        final token = await locator<AppPreferences>().authToken;
        headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
      }
    }

    // Send the api_request.
    final response = await ApiProvider.sendObjectRequest<Response>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters ?? {},
      data: data ?? {},
      cancelToken: cancelToken,
    );

    if (response != null && response.isLeft()) {
      return Left(((response as Left<BaseError, Response>).value));
    } else if (response != null && response.isRight()) {
      final resValue = (response as Right<BaseError, Response>).value;
      if (resValue.success != null && resValue.success==true) {
        return Right(resValue.data!);
      } else if (resValue.data != null && !resValue.success) {
        final messageCode = -1;
        switch (messageCode) {
          case MESSAGE_CODE_ACCOUNT_NOT_VERIFIED:
            return Left(AccountNotVerifiedError(message: ''));
          case MESSAGE_CODE_LOGIN_REQUIRED:
            return Left(LoginRequiredError(message: ''));
          default:
            return Left(CustomError(message: ''));
        // return Left(CustomError(message: resValue.message));
        }
      }
    /*  return Left(UnknownError());*/
    }
    return Left(UnknownError(message: 'UnKnown Error'));
  }

  Future<Either<BaseError, Data>> requestAuth<Data, Response extends BaseModel>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(responseStr, converter);

    // Specify the headers.
    final Map<String, dynamic> headers = {};

    // Get the language.
    final lang = await appConfig.currentLanguage;

    // headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
    if (withAuthentication) {
      if (await locator<AppPreferences>().hasToken) {
        final token = await locator<AppPreferences>().authToken;
        headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
      }
    }

    // Send the api_request.
    final response = await ApiProvider.sendObjectRequest<Response>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters ?? {},
      data: data ?? {},
      cancelToken: cancelToken,
    );

    if (response != null && response.isLeft()) {
      return Left(((response as Left<BaseError, Response>).value));
    } else if (response!=null  && response.isRight()) {
      final resValue = (response as Right<BaseError, Data>).value;
      if (resValue!=null) {
        return Right(resValue);
      }
    }
    return Left(UnknownError(message: 'UnKnown Error'));
  }


  Future<Either<BaseError, Data>> requestList<Data, Response extends BaseModel>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required HttpMethod method,
    required String url,
    Map<String, String>? queryParameters,
    Map<String, String>? data,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(responseStr, converter);

    // Specify the headers.
    final Map<String, dynamic> headers = {};

    // Get the language.
    final lang = await appConfig.currentLanguage;

    // headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
    if (withAuthentication) {
      if (await locator<AppPreferences>().hasToken) {
        final token = await locator<AppPreferences>().authToken;
        headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
      }
    }

    // Send the api_request.
    final response = await ApiProvider.sendListRequest<Response>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters ?? {},
      data: data ?? {},
      cancelToken: cancelToken,
    );

    if (response != null && response.isLeft()) {
      return Left(((response as Left<BaseError, Response>).value));
    } else if (response != null && response.isRight()) {
      final resValue = (response as Right<BaseError, Data>).value;
      if (resValue!=null) {
        return Right(resValue);
      }
   //   return Left(UnknownError());
    }
    return Left(UnknownError(message: 'UnKnown Error'));
  }
}

Future<Either<BaseError, Data>> requestMessage<Data, Response extends MessageApiResponse<Data>>({
  required String responseStr,
  required Response Function(Map<String, dynamic>) converter,
  required HttpMethod method,
  required String url,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? data,
  bool withAuthentication = false,
  required CancelToken cancelToken,
}) async {
  // Register the response.
  ModelsFactory.getInstance().registerModel(responseStr, converter);

  // Specify the headers.
  final Map<String, dynamic> headers = {};

  // Get the language.
  final lang = await appConfig.currentLanguage;

  // headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
  headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
  headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
  if (withAuthentication) {
    if (await locator<AppPreferences>().hasToken) {
      final token = await locator<AppPreferences>().authToken;
      headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    }
  }

  // Send the api_request.
  final response = await ApiProvider.sendObjectRequest<Response>(
    method: method,
    url: url,
    headers: headers,
    queryParameters: queryParameters ?? {},
    data: data ?? {},
    cancelToken: cancelToken,
  );

  if (response != null && response.isLeft()) {
    return Left(((response as Left<BaseError, Response>).value));
  } else if (response != null && response.isRight()) {
    final resValue = (response as Right<BaseError, Response>).value;
    if (resValue.success != null && resValue.success==true) {
      return Right(resValue.data!);
    } else if (resValue.data != null && !resValue.success) {
      final messageCode = -1;
      switch (messageCode) {
        case MESSAGE_CODE_ACCOUNT_NOT_VERIFIED:
          return Left(AccountNotVerifiedError(message: ''));
        case MESSAGE_CODE_LOGIN_REQUIRED:
          return Left(LoginRequiredError(message: ''));
        default:
         // return Left(CustomError(message: ''));
       return Left(CustomError(message: resValue.message));
      }
    }
    //return Left(UnknownError());
  }
  return Left(UnknownError(message: 'UnKnown Error'));
}


Future<Either<BaseError,List<Data>>> requestMessageList<Data, Response extends MessageApiResponse<List<Data>>>({
  required String responseStr,
  required Response Function(Map<String, dynamic>) converter,
  required HttpMethod method,
  required String url,
  Map<String, String>? queryParameters,
  Map<String, String>? data,
  bool withAuthentication = false,
  required CancelToken cancelToken,
}) async {
  // Register the response.
  ModelsFactory.getInstance().registerModel(responseStr, converter);

  // Specify the headers.
  final Map<String, dynamic> headers = {};

  // Get the language.
  final lang = await appConfig.currentLanguage;

  // headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
  headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
  headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
  if (withAuthentication) {
    if (await locator<AppPreferences>().hasToken) {
      final token = await locator<AppPreferences>().authToken;
      headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    }
  }

  // Send the api_request.
  final response = await ApiProvider.sendObjectRequest<Response>(
    method: method,
    url: url,
    headers: headers,
    queryParameters: queryParameters ?? {},
    data: data ?? {},
    cancelToken: cancelToken,
  );

  if (response != null && response.isLeft()) {
    return Left(((response as Left<BaseError, Response>).value));
  } else if (response != null && response.isRight()) {
    final resValue = (response as Right<BaseError, Response>).value;
    if (resValue!=null) {
      return Right(resValue.data!);
    }
    //return Left(UnknownError());
  }
  return Left(UnknownError(message: 'UnKnown Error'));
}