import 'package:json_annotation/json_annotation.dart';

abstract class BaseResponse<T> {
  T? data;

  BaseResponse(this.data);
}