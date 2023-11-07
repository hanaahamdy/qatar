
class SocialLoginRequest{
  final String? email;
  final String? profileId;

  SocialLoginRequest({this.email,  this.profileId});

  Map<String, dynamic> toJson() =>  {
    "email": email,
    "profile_id": profileId,
  };

}