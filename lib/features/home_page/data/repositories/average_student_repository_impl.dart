import 'package:student_project1/features/home_page/domain/entities/average_student_entity.dart';
import '../../domain/repositories/average_student_repository.dart';
import '../datasources/average_student_datasource.dart';

class AverageStudentRepositoryImpl extends AverageStudentRepository {
  final AverageStudentDataSource averageStudentDataSource;
  AverageStudentRepositoryImpl(this.averageStudentDataSource);

  @override
  Future<List<AverageStudentEntity>> getAverage() {
    return averageStudentDataSource.getAverage();
  }
}