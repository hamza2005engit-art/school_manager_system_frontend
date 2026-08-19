
import '../../domain/entity/schedul_entity.dart';
import '../../domain/repository/schedule_repository.dart';
import '../datasources/schedule_remote_data_source.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource remoteDataSource;
  ScheduleRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ScheduleEntity>> getSchedule() {
    return remoteDataSource.getSchedule();
  }

}