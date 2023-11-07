
import '../../../../core/entities/base_entity.dart';

class UserExistEntity extends BaseEntity{

  bool success;

  UserExistEntity({required this.success});

  @override
  // TODO: implement props
  List<Object?> get props => [success];



}