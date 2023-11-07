
import 'package:dio/src/cancel_token.dart';
import 'package:ehsan_1/features/services/domain/repository/services_repository.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/gallery_entity.dart';


class GalleryUseCase implements UseCase<List<GalleryEntity>, NoParams> {

  final ServicesRepository _repository;

  GalleryUseCase(this._repository);

  @override
  Future<Result<BaseError, List<GalleryEntity>>> call(NoParams params) =>
      _repository.getImages();
}
