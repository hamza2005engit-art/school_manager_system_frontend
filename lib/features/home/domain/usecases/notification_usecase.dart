import '../entities/notifincatins_user.dart';
import '../repositories/home_repository.dart';

class NotifincationUsecase {
  final HomeRepository repository;

  NotifincationUsecase(this.repository);

  Future<NotifincationUser> call(NotifincationUser notifincationuser) {
    return repository.notifincation(notifincationuser);
  }

  Future<List<NotifincationUser>> getAll() {
    return repository.getNotifications();
  }
}