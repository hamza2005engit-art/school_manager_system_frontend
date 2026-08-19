
import '../entities/register_user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<RegisterUser> call(RegisterUser registeruser) {
    return  repository.register(registeruser);
  }
}