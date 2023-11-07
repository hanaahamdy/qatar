

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/comment_service_entity.dart';
import 'add_service_model.dart';

part  'comment_service_model.g.dart';

@JsonSerializable()
class CommentServiceModel extends BaseModel<CommentServiceEntity>{

  @JsonKey(name:"id")
  final int? id;
  @JsonKey(name:"user_id")
  final int? userId;
  @JsonKey(name:"ad_id")
  final int? adId;
  @JsonKey(name:"comment")
  final String? comment;
  @JsonKey(name:"active")
  final bool? active;
  final User? user;
  @JsonKey(name:"created_at")
  final String? createdAt;


  CommentServiceModel(
      this.id, this.userId, this.adId, this.comment, this.active, this.user, this.createdAt);

  factory CommentServiceModel.fromJson(Map<String, dynamic> json) =>
      _$CommentServiceModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CommentServiceModelToJson(this);

  @override
  CommentServiceEntity toEntity() {
    return CommentServiceEntity(
      id: id,
      userId: userId,
      user: user,
      comment: comment,
      active: active,
      adId: adId,
      createdAt: createdAt
    );
  }

  }

