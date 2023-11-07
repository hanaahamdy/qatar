
import 'package:dio/dio.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/categories_service_request.dart';
import '../../data/request/search_request.dart';
import '../entity/add_service_entity.dart';
import '../repository/services_repository.dart';

class SearchUseCase implements UseCase<List<AddServiceEntity>, SearchParams> {
  final ServicesRepository _repository;

  SearchUseCase(this._repository);

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> call(SearchParams params) =>
      _repository.search(searchRequest: SearchRequest(search: params.search));

}

class SearchParams extends BaseParams{
  final String search;
  final CancelToken cancelToken;

  SearchParams({required this.search, required this.cancelToken}) : super(cancelToken: cancelToken);

}