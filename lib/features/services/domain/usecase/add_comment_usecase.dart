
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_comment_request.dart';
import '../entity/comment_service_entity.dart';
import '../repository/services_repository.dart';

class AddCommentUseCase implements UseCase<CommentServiceEntity, AddCommentParams> {

  final ServicesRepository _repository;

  AddCommentUseCase(this._repository);

  @override
  Future<Result<BaseError, CommentServiceEntity>> call(AddCommentParams params) =>
      _repository.addComment(addCommentRequest: params.data);
}


class AddCommentParams extends BaseParams{
  AddCommentRequest data;

  AddCommentParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}