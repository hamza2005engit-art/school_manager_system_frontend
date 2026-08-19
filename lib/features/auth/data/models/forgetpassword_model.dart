

import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

class ForgetPasswordModel extends ForgetpasswordUser {
  ForgetPasswordModel({
    required super.message,
    required super.email,
    required super.otp,
    required super.password,
    required super.password_confirmation,

  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'],
      email: json['email']?? '',
      otp: json['otp']?? '',
      password: json['password']?? '',
      password_confirmation: json['password_confirmation']?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,

    };
  }

}