import 'package:json_annotation/json_annotation.dart';
import '../../../../core/models/base_model.dart';
import '../../domain/entities/user_entity.dart';

import 'dart:convert';

class UserModel {
  String user;
  String password;
  List modelData;

  UserModel({
    required this.user,
    required this.password,
    required this.modelData,
  });

  static UserModel fromMap(Map<String, dynamic> user) {
    return new UserModel(
      user: user['user'],
      password: user['password'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      'password': password,
      'model_data': jsonEncode(modelData),
    };
  }
}
