import '../entity/schedul_entity.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleEntity>> getSchedule();
}