

import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/request/add_comment_request.dart';
import '../../data/request/add_construction_request.dart';
import '../../data/request/add_product_request.dart';
import '../../data/request/add_request.dart';
import '../../data/request/categories_service_request.dart';
import '../../data/request/custom_field_request.dart';
import '../../data/request/filter_request.dart';
import '../../data/request/order_request.dart';
import '../../data/request/search_request.dart';
import '../../data/request/service_details_request.dart';
import '../entity/add_service_entity.dart';
import '../entity/categories_service_entity.dart';
import '../entity/city_entity.dart';
import '../entity/comment_service_entity.dart';
import '../entity/custom_field_entity.dart';
import '../entity/gallery_entity.dart';
import '../entity/service_details_entity.dart';
import '../entity/services_entity.dart';

abstract class ServicesRepository extends Repository{

  Future<Result<BaseError, List<ServicesEntity>>> getServices();

  Future<Result<BaseError, List<CategoriesServiceEntity>>>  getCategoriesServices({CategoriesServiceRequest request});

  Future<Result<BaseError, List<AddServiceEntity>>>  getAddsService({AddRequest addRequest});
  Future<Result<BaseError, List<AddServiceEntity>>> getAllAddsService({AddRequest? addRequest});

  Future<Result<BaseError, ServiceDetailsEntity>>  getServiceDetails({ServiceDetailsRequest serviceDetailsRequest});


  Future<Result<BaseError, EmptyEntity>> addFavorite({ServiceDetailsRequest serviceDetailsRequest});

  Future<Result<BaseError, List<AddServiceEntity>>> getOrderServices({OrderRequest orderRequest});

  Future<Result<BaseError, List<CityEntity>>> getCities();

  Future<Result<BaseError, ServiceDetailsEntity>> addConstruction({AddConstructionRequest addConstructionRequest});

  Future<Result<BaseError, List<AddServiceEntity>>> filterServices({FilterRequest filterRequest});

  Future<Result<BaseError, List<CustomFieldEntity>>> getCustomFields({CustomFieldsRequest customFieldsRequest});
  Future<Result<BaseError, ServiceDetailsEntity>> addAddWithCustomFields({AddProductRequest addProductRequest});
  Future<Result<BaseError, CommentServiceEntity>> addComment({AddCommentRequest addCommentRequest});
  Future<Result<BaseError, List<AddServiceEntity>>>  search({SearchRequest searchRequest});

  Future<Result<BaseError, List<GalleryEntity>>> getImages();

}