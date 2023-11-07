
class ForgetPasswordRequest{
  final String? phone;
  final String? code;
  final String? newPassword;
  final String? confirmPassword;

  ForgetPasswordRequest({
    this.code,
    this.phone,
    this.confirmPassword,
    this.newPassword
});
}