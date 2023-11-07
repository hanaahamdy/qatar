

import '../../../../core/entities/base_entity.dart';
import '../../../services/data/model/add_service_model.dart';

class RegisterEntity extends BaseEntity{

  final int? code;
  final User? user;

  RegisterEntity({this.code, this.user});

  @override
  List<Object?> get props => [
    code,
    user
  ];

}