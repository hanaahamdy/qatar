import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../errors/bad_request_error.dart';
import '../errors/base_error.dart';
import '../errors/cancel_error.dart';
import '../errors/conflict_error.dart';
import '../errors/custom_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/http_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/net_error.dart';
import '../errors/not_found_error.dart';
import '../errors/socket_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unknown_error.dart';
import 'http_method.dart';
import 'models_factory.dart';

class ApiProvider {
  static Future<Either<BaseError, T>> uploadFile<T>({
    required String url,
    required String filePath,
    required String logoPath,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required Map<String, String> headers,
    // ProgressCallback? onSendProgress,
    // ProgressCallback? onReceiveProgress,
    required CancelToken cancelToken,
  }) async {

    Map<String, dynamic> dataMap = {};

    if(data!=null){
      dataMap.addAll(data);
    }
    dataMap.addAll({
      'logo': await MultipartFile.fromFile(logoPath, filename: logoPath.substring(logoPath.lastIndexOf('/')+1)),
      'file': await MultipartFile.fromFile(filePath, filename: filePath.substring(filePath.lastIndexOf('/')+1))
    });


    //add all files here from keys-------------

    try {
      print('--------------------  Start Request Body  --------------------'
          ' \n The URL is : [$url]');
      print('The sended Object Request is : $data');
      print('The sended dataMap Request is : $dataMap');
      print('The headers is : $headers');
      print('The queryParameters is : $queryParameters');
      print('The filePath is : $filePath \n '
          '--------------------  End Request Body  --------------------'
          ' \n');

      final response = await Dio().post(
        url,
        queryParameters: queryParameters,
        data: FormData.fromMap(dataMap),
        // onSendProgress: onSendProgress,
        // onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      // Get the decoded json
      var decodedJson;
      if (response.data is String)
        decodedJson = json.decode(response.data);
      else
        decodedJson = response.data;

      print('\n--------------------  Start Response Body  --------------------'
          ' \n The URL is : [ $url]');

      print('The decodedJson is : \n $decodedJson \n'
          '--------------------  End Response Body  --------------------'
          ' \n');

      // Return the http response with actual data
      return Right(ModelsFactory.getInstance().createModel<T>(decodedJson));
    }

    // Handling errors
    on DioError catch (e) {
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Left(SocketError(message: e.message ?? "socket Error : ${e.message}"));
    }
  }

  static Future<Either<BaseError, T>> uploadFiles<T>({
    required String url,
    required List<String>? filesPath,
    required List<String>? imagesPath,
    required String? logoPath,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required Map<String, String> headers,
    // ProgressCallback? onSendProgress,
    // ProgressCallback? onReceiveProgress,
    required CancelToken cancelToken,
  }) async {

    Map<String, dynamic> dataMap = {};
    List<MultipartFile> partFiles =[];
    List<MultipartFile> partImages =[];

    if(data!=null){
      dataMap.addAll(data);
    }

    for(var image in imagesPath ?? []){
      partImages.add(await MultipartFile.fromFile(image, filename: image.substring(image.lastIndexOf('/')+1)));
    }

    for(var file in filesPath ?? []){
      partFiles.add(await MultipartFile.fromFile(file, filename: file.substring(file.lastIndexOf('/')+1)));
    }

    dataMap.addAll({
      'logo': await MultipartFile.fromFile(logoPath ?? '', filename: logoPath!.substring(logoPath.lastIndexOf('/')+1)),
      'images': partImages,
      'files': partFiles
    });

    //add all files here from keys-------------

    try {
      print('--------------------  Start Request Body  --------------------'
          ' \n The URL is : [$url]');
      print('The sended Object Request is : $data');
      print('The sended dataMap Request is : $dataMap');
      print('The headers is : $headers');
      print('The queryParameters is : $queryParameters');

      final response = await Dio().post(
        url,
        queryParameters: queryParameters,
        data: FormData.fromMap(dataMap),
        // onSendProgress: onSendProgress,
        // onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      // Get the decoded json
      var decodedJson;
      if (response.data is String)
        decodedJson = json.decode(response.data);
      else
        decodedJson = response.data;

      print('\n--------------------  Start Response Body  --------------------'
          ' \n The URL is : [ $url]');

      print('The decodedJson is : \n $decodedJson \n'
          '--------------------  End Response Body  --------------------'
          ' \n');

      // Return the http response with actual data
      return Right(ModelsFactory.getInstance().createModel<T>(decodedJson));
    }

    // Handling errors
    on DioError catch (e) {
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Left(SocketError(message: e.message));
    }
  }

  static Future<Either<BaseError, T>> sendObjectRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    required Map<String, dynamic> headers,
    Map<String, dynamic>? queryParameters,
    required CancelToken cancelToken,
  }) async {
    try {
      print('--------------------  Start Request Body  --------------------'
          ' \n The HttpMethod & URL are : [$method: $url]');
      print('The sended Object Request is : $data');
      print('The headers is : $headers');
      print('The queryParameters is : $queryParameters \n '
          '--------------------  End Request Body  --------------------'
          ' \n');

      // Get the response from the server
      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await Dio().get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            // cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await Dio().post(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            //cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await Dio().put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            //cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await Dio().delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            // cancelToken: cancelToken,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;
      if (response.data is String && response.data.toString().isNotEmpty) {
        decodedJson = json.decode(response.data.toString());
      }
      else if(response.data.toString().isEmpty){
        decodedJson = {"": ""};
      }
      else {
        decodedJson = response.data;
      }

      print('\n--------------------  Start Response Body  --------------------'
          ' \n The HttpMethod & URL are : [$method: $url]');

      print('The decodedJson is : \n $decodedJson \n'
          '--------------------  End Response Body  --------------------'
          ' \n');

      // Return the http response with actual data
      return Right(ModelsFactory.getInstance().createModel<T>(decodedJson));
    }

    // Handling errors
    on DioError catch (e) {
      print('Exception is DioError $e');
      print('Exception is DioError message ${e.message}');
      print(
          'Exception is DioError requestOptions.headers ${e.requestOptions.headers}');
      print('Exception is DioError error ${e.error}');
      print('Exception is DioError api_request.data ${e.requestOptions.data}');
      print('Exception is DioError path ${e.requestOptions.path}');
      print('Exception is DioError response ${e.response}');
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Left(SocketError(message: e.message));
    }
  }

  static Future<Either<BaseError, List<T>>> sendListRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    required Map<String, dynamic> headers,
    Map<String, dynamic>? queryParameters,
    required CancelToken cancelToken,
  }) async {
    try {
      print('[$method: $url]');

      // Get the response from the server
      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await Dio().get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await Dio().post(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await Dio().put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await Dio().delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;
      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      print('\n--------------------  Start Response Body  --------------------'
          ' \n The HttpMethod & URL are : [$method: $url]');

      print('The decodedJson is : \n $decodedJson \n'
          '--------------------  End Response Body  --------------------'
          ' \n');


      // Return the http response with actual data
      // return Right(
      //     ModelsFactory.getInstance().createModelsList<T>(decodedJson['data']) ?? []);
      return Right(
          ModelsFactory.getInstance().createModelsList<T>(decodedJson) ?? []);
    }

    // Handling errors
    on DioError catch (e) {
      print('Exception is DioError $e');
      print('Exception is DioError message ${e.message}');
      print(
          'Exception is DioError requestOptions.headers ${e.requestOptions.headers}');
      print('Exception is DioError error ${e.error}');
      print('Exception is DioError api_request.data ${e.requestOptions.data}');
      print('Exception is DioError path ${e.requestOptions.path}');
      print('Exception is DioError response ${e.response}');
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Left(SocketError(message: e.message));
    }
  }

  static BaseError _handleDioError(DioError error) {
    if (error.type == DioErrorType.other ||
        error.type == DioErrorType.response) {
      if (error is SocketException) return SocketError(message: error.message);
      print("SocketException SocketException SocketException SocketException");
      if (error.type == DioErrorType.response) {
        print("DioErrorType.RESPONSE ${error.message}");
        print("DioErrorType.RESPONSE ${error.response}");
        switch (error.response?.statusCode) {
          case 400:
            return BadRequestError(message: error.response?.data['error'] ?? "");
          case 401:
            return UnauthorizedHttpError(
                message: error.response?.data['message'] ?? "");
          case 403:
            return ForbiddenError(message: error.response?.data['message'] ?? "Forbidden Error");
          case 404:
            return NotFoundError(message: error.response?.data['message'] ?? "notFound Error");
          case 409:
            return ConflictError(message: error.response?.data['message'] ?? "confilct error");
          case 422:
            return CustomError(message: error.response?.data['message'] ?? "");
          case 500:
            return InternalServerError(
                message: error.response?.data['message'] ?? "");
          default:
            return HttpError(message: error.response?.data ?? "httpError");
        }
      }
      return NetError(message: error.response?.data['message'] ?? "Net Error");
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return TimeoutError(message: error.response?.data['message'] ?? "Timeout Error");
    } else if (error.type == DioErrorType.cancel) {
      return CancelError(message: error.response?.data['message'] ?? "Cancel Error");
    } else
      return UnknownError(message: error.response?.data['message'] ?? "Unknown Error");
  }
}
