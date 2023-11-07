



import '../../../../core/entities/base_entity.dart';

class LoginEntity  extends BaseEntity{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? token;

  LoginEntity({
    required this.id,
     this.name,
     this.email,
     this.phone,
     this.token});

  Map<String, dynamic> toJson()=> {
   "id": id,
   "name": name,
   "email": email,
   "token": token ,
    "phone": phone
  };

    static fromJson(Map<String, dynamic> json) => LoginEntity(id: json['id'],
      name: json['name'], email: json['email'],
      phone: json['phone'], token: json['token']);

  @override
  List<Object?> get props => [
    id??0,
    name ??'',
    phone?? '',
    email??'',
    token ?? ''
  ];
}
