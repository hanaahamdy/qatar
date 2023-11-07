


import '../entities/empty_entity.dart';
import 'base_model.dart';

class EmptyModel extends BaseModel<EmptyEntity>{

  EmptyModel();

  factory EmptyModel.fromJson(Map<String, dynamic> json){
    return EmptyModel();
  }

  @override
  EmptyEntity toEntity() {
    return EmptyEntity();
  }


}