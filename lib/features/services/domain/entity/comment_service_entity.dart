


import '../../../../core/entities/base_entity.dart';
import '../../data/model/add_service_model.dart';

class CommentServiceEntity extends BaseEntity{

  final int? id;
  final int? userId;
  final int? adId;
  final String? comment;
  final bool? active;
  final User? user;
  final String? createdAt;


  CommentServiceEntity({
      this.id, this.userId, this.adId, this.comment, this.active, this.user, this.createdAt});

  @override
  List<Object?> get props => [
    id,
    userId,
    active,
    adId,
    user,
    comment,
    createdAt
  ];

}