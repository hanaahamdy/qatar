import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ehsan_1/features/services/data/datasource/service_remote_datasource.dart';
import '../../../../core/constants.dart';
import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/http/http_method.dart';
import '../../../../core/models/empty_model.dart';
import '../api_response/add_comment_service_response.dart';
import '../api_response/add_new_service_response.dart';
import '../api_response/add_service_response.dart';
import '../api_response/categories_service_response.dart';
import '../api_response/city_response.dart';
import '../api_response/comments_service_response.dart';
import '../api_response/custom_fields_response.dart';
import '../api_response/home_response.dart';
import '../api_response/search_response.dart';
import '../api_response/service_details_response.dart';
import '../api_response/services_response.dart';
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

class ConcreteServicesRemoteDataSource extends ServicesRemoteDataSource{

  @override
  Future<Either<BaseError,List<ServicesModel>>> getServices() {
    return request<List<ServicesModel>, ServicesResponse>(
      responseStr: 'ServicesResponse',
      converter: (json) => ServicesResponse.fromJson(json),
      method: HttpMethod.GET,
      url: API_SERVICES,
      withAuthentication: false,
      cancelToken: CancelToken(),
    );
  }


  @override
  Future<Either<BaseError, List<CategoriesServiceModel>>> getCategoriesService({CategoriesServiceRequest? categoriesServiceRequest}) {
    return request<List<CategoriesServiceModel>, CategoriesServicesResponse>(
    responseStr: 'CategoriesServicesResponse',
    converter: (json) => CategoriesServicesResponse.fromJson(json),
    method: HttpMethod.GET,
    url: ApiCategories(categoriesServiceRequest!.serviceId),
    withAuthentication: true,
    cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<AddServiceModel>>> getAddsService({AddRequest? addRequest}) {
    return request<List<AddServiceModel>, AddServiceResponse>(
      responseStr: 'AddServiceResponse',
      converter: (json) => AddServiceResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiAddsCategorie(addRequest!.serviceId, addRequest.categoryId),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, ServiceDetailsModel>> getServiceDetails({ServiceDetailsRequest? serviceDetailsRequest}) {
    return request<ServiceDetailsModel, ServiceDetailsResponse>(
      responseStr: 'ServiceDetailsResponse',
      converter: (json) => ServiceDetailsResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiServiceDetails(serviceDetailsRequest!.serviceId),
      withAuthentication: false,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<CommentServiceModel>>> getServiceComments({CommentServiceRequest? commentServiceRequest}) {
    return request<List<CommentServiceModel>, CoomentsServiceResponse>(
      responseStr: 'CoomentsServiceResponse',
      converter: (json) => CoomentsServiceResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiServiceComments(commentServiceRequest?.serviceId),
      withAuthentication: false,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, EmptyModel>> addFavorite({ServiceDetailsRequest? serviceDetailsRequest}) {
    return requestAuth<EmptyModel, EmptyModel>(
      responseStr: 'EmptyModel',
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.GET,
      url: ApiAddFavorite(serviceDetailsRequest!.serviceId),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<AddServiceModel>>> getOrderService({OrderRequest? orderRequest}) {
    return request<List<AddServiceModel>, AddServiceResponse>(
      responseStr: 'AddServiceResponse',
      converter: (json) => AddServiceResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiSortServices(orderRequest!.id, orderRequest.serviceId, orderRequest.order),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<AddServiceModel>>> getAlAddsService({AddRequest? addRequest}) {
    return request<List<AddServiceModel>, AddServiceResponse>(
      responseStr: 'AddServiceResponse',
      converter: (json) => AddServiceResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiAllAdds(addRequest!.serviceId),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<CityModel>>> getCities() {
    return requestMessage<List<CityModel>, CityResposne>(
      responseStr: 'CityResposne',
      converter: (json) => CityResposne.fromJson(json),
      method: HttpMethod.GET,
      url: API_BASE_CITIES,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }


  @override
  Future<Either<BaseError, ServiceDetailsModel>> addConstruction({AddConstructionRequest? addConstructionRequest}) async{
    return requestUploadFiles<ServiceDetailsModel, AddNewServiceResponse>(
      responseStr: 'AddNewServiceResponse',
      converter: (json) => AddNewServiceResponse.fromJson(json),
      logo: addConstructionRequest!.logo,
      files: addConstructionRequest.file,
      images: addConstructionRequest.images,
      data: {
        'service_id' : addConstructionRequest.serviceId,
        'category_id': addConstructionRequest.categoryId,
        'city_id': addConstructionRequest.cityId,
        'title': addConstructionRequest.title,
        'description': addConstructionRequest.description,
        'address': addConstructionRequest.address,
        'lat': addConstructionRequest.lat,
        'lng': addConstructionRequest.lng,
        'phone': addConstructionRequest.phone,
        'email': addConstructionRequest.email,
        'whatsapp': addConstructionRequest.whatsapp,
      },
      url: API_BASE_ADD,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<AddServiceModel>>> getFilterResults({FilterRequest? filterRequest}) {
    return request<List<AddServiceModel>, AddServiceResponse>(
      responseStr: 'AddServiceResponse',
      converter: (json) => AddServiceResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiFilterAdds(filterRequest!.id!, filterRequest.categories!,filterRequest.cityId, filterRequest.startDate, filterRequest.endDate),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<CustomFieldModel>>> getCustomFields({CustomFieldsRequest? customFieldsRequest}) {
    return requestMessage<List<CustomFieldModel>, CustomFieldsResposne>(
      responseStr: 'CustomFieldsResposne',
      converter: (json) => CustomFieldsResposne.fromJson(json),
      method: HttpMethod.GET,
      url: getCustomFieldsUrl(customFieldsRequest!.serviceId),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, ServiceDetailsModel>> addAddWithCustomFields({AddProductRequest? addProductRequest}) {

    var data =  {
      'service_id' : addProductRequest!.serviceId,
      'category_id': addProductRequest.categoryId,
      'city_id': addProductRequest.cityId,
      'title': addProductRequest.title,
      'description': addProductRequest.description,
      'address': addProductRequest.address,
      'lat': addProductRequest.lat,
      'lng': addProductRequest.lng,
      'phone': addProductRequest.phone,
      'email': addProductRequest.email,
      'whatsapp': addProductRequest.whatsapp
    };
    data.addAll(addProductRequest.customs!);

    return requestUploadFiles<ServiceDetailsModel, AddNewServiceResponse>(
      responseStr: 'AddNewServiceResponse',
      converter: (json) => AddNewServiceResponse.fromJson(json),
      logo: addProductRequest.logo,
      files: addProductRequest.file,
      images: addProductRequest.images,
      data: data,
      url: API_BASE_ADD,
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, CommentServiceModel>> addNewComment({AddCommentRequest? addCommentRequest}) {
    return request<CommentServiceModel, AddComentsServiceResponse>(
      responseStr: 'AddComentsServiceResponse',
      converter: (json) => AddComentsServiceResponse.fromJson(json),
      method: HttpMethod.POST,
      url: API_BASE_COMMENTS,
      data: {
        "ad_id": addCommentRequest!.addId,
        "comment": addCommentRequest.comment,
        "user_id": addCommentRequest.userId
      },
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<AddServiceModel>>> searchServices({SearchRequest? searchRequest}) {
    return requestMessage<List<AddServiceModel>, SearchResponse>(
      responseStr: 'SearchResponse',
      converter: (json) => SearchResponse.fromJson(json),
      method: HttpMethod.GET,
      url: ApiSearch(searchRequest!.search),
      withAuthentication: true,
      cancelToken: CancelToken(),
    );
  }

  @override
  Future<Either<BaseError, List<GalleryModel>>> getImages() {
    return requestMessage<List<GalleryModel>,Homesponse>(
      responseStr: 'Homesponse',
      converter: (json) => Homesponse.fromJson(json),
      method: HttpMethod.GET,
      url: API_GALLERY,
      withAuthentication: false,
      cancelToken: CancelToken(),
    );
  }

}