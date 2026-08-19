import 'package:student_project1/features/home_page/domain/repositories/statistics_repositories.dart';

import '../entities/statistics.dart';

class GetStudentsCountUseCase {

  final StatisticsRepository statisticsRepository;

  GetStudentsCountUseCase(this.statisticsRepository);

  Future<StatisticsEntity> call() {
    return statisticsRepository.getCountStudents();
  }
}