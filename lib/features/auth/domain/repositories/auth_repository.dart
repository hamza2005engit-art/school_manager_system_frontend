import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';


import '../entities/first_forgetpassword_user.dart';
import '../entities/register_user.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<RegisterUser> register( RegisterUser registeruser);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<ForgetpasswordUser> resetPassword(
      ForgetpasswordUser resetPasswordUser
      );
}