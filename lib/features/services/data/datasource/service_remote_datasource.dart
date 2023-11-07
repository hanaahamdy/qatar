
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/models/empty_model.dart';
import '../model/add_service_model.dart';
import '../model/cat_service_model.dart';
import '../model/city_model.dart';
import '../model/comment_service_model.dart';
import '../model/custom_filel_model.dart';
import '../model/gallery_model.dart';
import '../model/service_details_model.dart';
import '../model/services_model.dart';
import '../request/add_comment_request.dart';
import '../request/add_construction_request.dart';
import '../request/add_product_request.dart';
import '../request/add_request.dart';
import '../request/categories_service_request.dart';
import '../request/comment_service_request.dart';
import '../request/custom_field_request.dart';
import '../request/filter_request.dart';
import '../request/order_request.dart';
import '../request/search_request.dart';
import '../request/service_details_request.dart';

abstract class ServicesRemoteDataSource extends RemoteDataSource{

  Future<Either<BaseError, List<ServicesModel>>> getServices();

  Future<Either<BaseError, List<CategoriesServiceModel>>> getCategoriesService({CategoriesServiceRequest categoriesServiceRequest});

  Future<Either<BaseError, List<AddServiceModel>>> getAddsService({AddRequest addRequest});
  Future<Either<BaseError, List<AddServiceModel>>> getAlAddsService({AddRequest? addRequest});

  Future<Either<BaseError, ServiceDetailsModel>> getServiceDetails({ServiceDetailsRequest? serviceDetailsRequest});

  Future<Either<BaseError, List<CommentServiceModel>>> getServiceComments({CommentServiceRequest? commentServiceRequest});

  Future<Either<BaseError, EmptyModel>> addFavorite({ServiceDetailsRequest? serviceDetailsRequest});

  Future<Either<BaseError, List<AddServiceModel>>> getOrderService({OrderRequest orderRequest});

  Future<Either<BaseError, List<CityModel>>> getCities();

  Future<Either<BaseError, ServiceDetailsModel>> addConstruction({AddConstructionRequest addConstructionRequest});
  Future<Either<BaseError, List<AddServiceModel>>> getFilterResults({FilterRequest filterRequest});

  Future<Either<BaseError, List<CustomFieldModel>>> getCustomFields({CustomFieldsRequest? customFieldsRequest});
  Future<Either<BaseError, ServiceDetailsModel>> addAddWithCustomFields({AddProductRequest addProductRequest});
  Future<Either<BaseError, CommentServiceModel>> addNewComment({AddCommentRequest addCommentRequest});
  Future<Either<BaseError, List<AddServiceModel>>> searchServices({SearchRequest searchRequest});
  Future<Either<BaseError, List<GalleryModel>>> getImages();
}