// import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source.dart';
// import 'package:student_project1/features/auth/data/models/forgetpassword_model.dart';
// import 'package:student_project1/features/auth/data/models/user_model.dart';
// import 'package:student_project1/features/auth/domain/entities/first_forgetpassword_user.dart';
//
//
// import '../../domain/entities/register_user.dart';
// import '../models/first_forgetpassword_model.dart';
// import '../models/registeruser_model.dart';
//
// class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
//   @override
//   Future<UserModel> login(String phone, String password) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return UserModel(
//       id: 99,
//       name: "Hamza AlRefai",
//       email: "hamza@example.com",
//       token: "mock_token",
//     );
//   }
//   @override
//   Future<RegisterUserModel> register(RegisterUser registerUser) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return RegisterUserModel(
//       fullName: registerUser.fullName,
//       email: registerUser.email,
//       phone: registerUser.phone,
//       location: registerUser.location,
//       role: registerUser.role,
//       password: registerUser.password,
//       passwordConfirmation: registerUser.passwordConfirmation,
//       profileImagePath: registerUser.profileImagePath,
//       token: "mock_token",
//     );
//   }
//
//
//
//
//
//
//
//
//
//   Future<ForgetPasswordModel> forgetpassword(
//       String email,
//       String ip,
//       String new_password,
//       String confirmed_password,
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return ForgetPasswordModel(
//       id: 99,
//       email: email,
//       ip: ip,
//       new_password: new_password,
//       confirmed_password: confirmed_password,
//       token: "mock_token",
//     );
//   }
//
//   @override
//   Future<ForgotPasswordModel> firstforgetpassword(
//       ForgotPasswordResponse firstforgetpassworduser) async {
//
//     await Future.delayed(const Duration(seconds: 1));
//
//     return ForgotPasswordModel(
//
//       message: "OTP sent successfully",
//     );
//   }
// }
