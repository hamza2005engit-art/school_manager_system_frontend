import '../entity/exercises_entity.dart';
import '../repository/exercises_repository.dart';

class GetExerciseForStudentUseCase {
  final ExerciseRepository exercisesRepository;

  GetExerciseForStudentUseCase(this.exercisesRepository);

  Future<List<ExercisesEntity>> call() {
    return exercisesRepository.getExercisesForStudent();
  }
}