class LoginRequest {
  String? phone;
  String? password;

  LoginRequest({this.phone, this.password});


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}