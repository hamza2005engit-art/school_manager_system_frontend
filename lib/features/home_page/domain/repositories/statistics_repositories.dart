import '../entities/statistics.dart';

abstract class StatisticsRepository {

  Future<StatisticsEntity> getCountStudents();

  Future<StatisticsEntity> getCountTeachers();
}