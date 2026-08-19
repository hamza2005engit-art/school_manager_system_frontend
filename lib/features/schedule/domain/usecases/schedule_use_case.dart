
import '../entity/schedul_entity.dart';
import '../repository/schedule_repository.dart';

class ScheduleUseCase {
  final ScheduleRepository scheduleRepository;

  ScheduleUseCase(this.scheduleRepository);

  Future<List<ScheduleEntity>> call() {
    return scheduleRepository.getSchedule();
  }
}