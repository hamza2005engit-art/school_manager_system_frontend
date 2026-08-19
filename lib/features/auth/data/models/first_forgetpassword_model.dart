import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';
import '../../domain/entities/first_forgetpassword_user.dart';


class ForgotPasswordModel extends ForgotPasswordResponse {
  ForgotPasswordModel({required super.message});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      message: json['message'] ?? '',
    );
  }
}