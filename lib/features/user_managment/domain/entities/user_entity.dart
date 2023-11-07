import '../../../../core/entities/base_entity.dart';

class UserEntity extends BaseEntity{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  dynamic locale;
  dynamic deviceToken;
  String? role;
  List<String>? permissions;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? tokenType;
  String? bearer;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.locale,
    this.deviceToken,
    this.role,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
    this.tokenType,
    this.bearer}
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}