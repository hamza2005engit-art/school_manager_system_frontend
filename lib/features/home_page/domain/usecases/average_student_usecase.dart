import '../entities/average_student_entity.dart';
import '../repositories/average_student_repository.dart';

class AverageStudentUseCase {
  final AverageStudentRepository repository;
  AverageStudentUseCase(this.repository);

  Future<List<AverageStudentEntity>> call() async {
    return await repository.getAverage();
  }
}