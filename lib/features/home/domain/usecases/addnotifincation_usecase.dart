
import '../entities/addnotifincation_user.dart';
import '../repositories/home_repository.dart';

class AddNotifincationUsecase {
  final HomeRepository repository;

  AddNotifincationUsecase(this.repository);

  Future<AddNotifincationUser> call(AddNotifincationUser addnotifincationuser) {
    return  repository.addnotifincation(addnotifincationuser);
  }
}