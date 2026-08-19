import '../entities/statistics.dart';
import '../repositories/statistics_repositories.dart';

class GetTeacherCountUseCase {

  final StatisticsRepository statisticsRepository;

  GetTeacherCountUseCase(this.statisticsRepository);

  Future<StatisticsEntity> call() {
    return statisticsRepository.getCountTeachers();
  }
}