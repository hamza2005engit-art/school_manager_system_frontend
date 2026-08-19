import 'package:student_project1/features/home_page/domain/repositories/statistics_repositories.dart';

import '../../domain/entities/statistics.dart';
import '../datasources/statistics_datasource.dart';

class StatiscticsRepositoryImpl extends StatisticsRepository {

  final StatisticsRemoteDataSource statisticsRemoteDataSource;

  StatiscticsRepositoryImpl(this.statisticsRemoteDataSource);

  @override
  Future<StatisticsEntity> getCountStudents() {
    return statisticsRemoteDataSource.getContStudents();
  }

  @override
  Future<StatisticsEntity> getCountTeachers() {
    return statisticsRemoteDataSource.getCountTeachcers();
  }


}