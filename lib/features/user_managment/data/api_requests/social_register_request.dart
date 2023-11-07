
class SocialRegisterRequest{
  final String? email;
  final String? profileId;
  final String? provideName;
  final String? name;
  final String? phone;

  SocialRegisterRequest({this.name, this.email, this.phone, this.profileId, this.provideName});

  Map<String, dynamic> toJson() =>  {
    "email": email,
    "phone": phone,
    "name": name,
    "profile_id": profileId,
    "provide_name": provideName
  };

}