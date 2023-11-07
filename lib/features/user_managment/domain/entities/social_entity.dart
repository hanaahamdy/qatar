
import '../../../../core/entities/base_entity.dart';

class SocialEntity extends BaseEntity{

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? token;

  SocialEntity({this.name, this.id, this.email, this.phone, this.token});

  @override
  List<Object?> get props => [
    token,
    email,
    name,
    id,
    phone
  ];

}