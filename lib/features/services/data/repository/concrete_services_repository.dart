


import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/models/empty_model.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/add_service_entity.dart';
import '../../domain/entity/categories_service_entity.dart';
import '../../domain/entity/city_entity.dart';
import '../../domain/entity/comment_service_entity.dart';
import '../../domain/entity/custom_field_entity.dart';
import '../../domain/entity/gallery_entity.dart';
import '../../domain/entity/service_details_entity.dart';
import '../../domain/entity/services_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../datasource/service_remote_datasource.dart';
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

class ConcreteServicesRepository extends ServicesRepository{

  final ServicesRemoteDataSource remoteDataSource;

  ConcreteServicesRepository(this.remoteDataSource);


  @override
  Future<Result<BaseError, List<ServicesEntity>>> getServices() async{
    final remoteResult =await remoteDataSource.getServices();
    return executeForList<ServicesModel, ServicesEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<CategoriesServiceEntity>>> getCategoriesServices({CategoriesServiceRequest? request}) async{
    final remoteResult =await remoteDataSource.getCategoriesService(categoriesServiceRequest : request!);
    return executeForList<CategoriesServiceModel, CategoriesServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> getAddsService({AddRequest? addRequest}) async{
        final remoteResult =await remoteDataSource.getAddsService(addRequest: addRequest!);
        return executeForList<AddServiceModel, AddServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> getServiceDetails({ServiceDetailsRequest? serviceDetailsRequest}) async{
      final remoteResult =await remoteDataSource.getServiceDetails(serviceDetailsRequest : serviceDetailsRequest!);
      return execute<ServiceDetailsModel, ServiceDetailsEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<CommentServiceEntity>>> getCommentsService({CommentServiceRequest? commentServiceRequest}) async{
    final remoteResult =await remoteDataSource.getServiceComments(commentServiceRequest: commentServiceRequest!);
    return executeForList<CommentServiceModel, CommentServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, EmptyEntity>> addFavorite({ServiceDetailsRequest? serviceDetailsRequest}) async{
    final remoteResult =await remoteDataSource.addFavorite(serviceDetailsRequest : serviceDetailsRequest);
    return execute<EmptyModel, EmptyEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> getOrderServices({OrderRequest? orderRequest}) async{
    final remoteResult =await remoteDataSource.getOrderService(orderRequest: orderRequest!);
    return executeForList<AddServiceModel, AddServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> getAllAddsService({AddRequest? addRequest}) async{
    final remoteResult =await remoteDataSource.getAlAddsService(addRequest: addRequest!);
    return executeForList<AddServiceModel, AddServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<CityEntity>>> getCities() async{
    final remoteResult =await remoteDataSource.getCities();
    return executeForList<CityModel, CityEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> addConstruction({AddConstructionRequest? addConstructionRequest}) async{
    final remoteResult =await remoteDataSource.addConstruction(addConstructionRequest: addConstructionRequest!);
    return execute<ServiceDetailsModel, ServiceDetailsEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> filterServices({FilterRequest? filterRequest}) async{
    final remoteResult =await remoteDataSource.getFilterResults(filterRequest: filterRequest!);
    return executeForList<AddServiceModel, AddServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<CustomFieldEntity>>> getCustomFields({CustomFieldsRequest? customFieldsRequest}) async{
    final remoteResult =await remoteDataSource.getCustomFields(customFieldsRequest: customFieldsRequest!);
    return executeForList<CustomFieldModel, CustomFieldEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> addAddWithCustomFields({AddProductRequest? addProductRequest}) async{
    final remoteResult =await remoteDataSource.addAddWithCustomFields(addProductRequest: addProductRequest!);
    return execute<ServiceDetailsModel, ServiceDetailsEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, CommentServiceEntity>> addComment({AddCommentRequest? addCommentRequest}) async{
    final remoteResult =await remoteDataSource.addNewComment(addCommentRequest: addCommentRequest!);
    return execute<CommentServiceModel, CommentServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> search({SearchRequest? searchRequest}) async{
    final remoteResult =await remoteDataSource.searchServices(searchRequest: searchRequest!);
    return executeForList<AddServiceModel, AddServiceEntity>(remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, List<GalleryEntity>>> getImages() async{
    final remoteResult =await remoteDataSource.getImages();
    return executeForList<GalleryModel, GalleryEntity>(remoteResult: remoteResult);
  }

}