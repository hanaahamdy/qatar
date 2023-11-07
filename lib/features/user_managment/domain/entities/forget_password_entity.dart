

import '../../../../core/entities/base_entity.dart';
import 'login_entity.dart';

class ForgetPasswordEntity extends BaseEntity{

  final int? code;
  final LoginEntity? user;

  ForgetPasswordEntity({this.code, this.user});

  @override
  List<Object?> get props => [
    code, user
  ];

}