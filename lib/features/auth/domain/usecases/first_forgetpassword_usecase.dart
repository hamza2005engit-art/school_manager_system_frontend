import '../entities/first_forgetpassword_user.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<ForgotPasswordResponse> call(String email) {
    return repository.forgotPassword(email);
  }
}