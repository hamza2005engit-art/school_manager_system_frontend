import '../entities/average_student_entity.dart';

abstract class AverageStudentRepository {
  Future<List<AverageStudentEntity>> getAverage();
}