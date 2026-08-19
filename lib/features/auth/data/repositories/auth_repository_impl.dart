import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source_moke.dart';
import 'package:student_project1/features/auth/data/models/first_forgetpassword_model.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';


import '../../domain/entities/first_forgetpassword_user.dart';
import '../../domain/entities/register_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';



class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }



  @override
  Future<RegisterUser> register(RegisterUser registerUser) async {
    return await remoteDataSource.register(
      registerUser
      // registerUser.name,
      // registerUser.phone,
      // registerUser.location,
      // registerUser.subject,
      // registerUser.password,
      // registerUser.confermpassword
    );
  }










  @override
  Future<ForgetpasswordUser> resetPassword(
      ForgetpasswordUser resetPasswordUser) async {
    return await remoteDataSource.resetPassword(
      resetPasswordUser.email,
      resetPasswordUser.otp,
      resetPasswordUser.password,
      resetPasswordUser.password_confirmation,
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) {
    return remoteDataSource.forgotPassword(email);
  }
}
