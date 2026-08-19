
import '../repository/exercises_repository.dart';

class DeleteExerciseUseCase {

  final ExerciseRepository exercisesRepository;

  DeleteExerciseUseCase(this.exercisesRepository);

  Future<void> call(int id) {
    return exercisesRepository.deleteExercise(id);
  }
}