import 'package:dio/dio.dart';

import 'base_params.dart';

class NoParams extends BaseParams {
  NoParams({required CancelToken cancelToken})
      : super(cancelToken: cancelToken);
}
