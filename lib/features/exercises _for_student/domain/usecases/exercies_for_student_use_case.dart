
import '../entity/exercies_for_student_entity.dart';
import '../repositories/exercies_for_student_repostory.dart';

class ExerciesForStudentUseCase {

  final ExerciesForStudentRepository exerciesForStudentRepository;
  ExerciesForStudentUseCase(this.exerciesForStudentRepository);

  Future<ExerciesForStudentEntity> call() {
    return exerciesForStudentRepository.getExerciesForStudent();
  }
}