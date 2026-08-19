import '../../domain/entities/register_user.dart';


class RegisterUserModel extends RegisterUser {
  RegisterUserModel({
  required super.fullName,
  required super.email,
  required super.phone,
  required super.location,
  required super.role,
  required super.password,
  required super.passwordConfirmation,
  required super.profileImagePath,
    super.token,
});

factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
  final userData = json['user'];
  return RegisterUserModel(
    fullName: userData['full_name'] ?? '',
    email: userData['email'] ?? '',
    phone: userData['phone'] ?? '',
    location: userData['location'] ?? '',
    role: '', // الأدوار غالباً تأتي بشكل منفصل أو عبر التوكن
    password: '',
    passwordConfirmation: '',
    profileImagePath: userData['profile_image'] ?? '',
    token: json['token'],
  );
}
 }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'fullName': fullName,
  //     'phone': phone,
  //     'location': location,
  //     'subject': subject,
  //     'password': password,
  //     'password_confirmation': confermpassword,
  //   };
  // }

