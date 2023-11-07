
class PhoneVerifyRequest {
  final String? phone;
  final String? code;

  PhoneVerifyRequest({this.phone, this.code});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['code'] = code;
    return map;
  }
}