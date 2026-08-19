import '../entities/forgetpassword_user.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<ForgetpasswordUser> call(
      ForgetpasswordUser resetPasswordUser,
      ) {
    return repository.resetPassword(resetPasswordUser);
  }
}