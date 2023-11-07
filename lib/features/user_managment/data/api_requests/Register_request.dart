class RegisterRequest {
  RegisterRequest(
      {this.email,
      this.phone,
      this.password,
      this.confirmPass,
      this.name,
      this.agree});

  RegisterRequest.fromJson(dynamic json) {
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    name = json['name'];
    agree = json['agree'];
    confirmPass = json['password_confirmation'];
  }

  String? email;
  String? phone;
  String? password;
  String? name;
  String? confirmPass;
  int? agree;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['password_confirmation'] = confirmPass;
    map['name'] = name;
    map['agree'] = agree;
    return map;
  }
}
