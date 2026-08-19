
import '../entity/exercises_entity.dart';
import '../repository/exercises_repository.dart';

class ExercisesUseCase {

  final ExerciseRepository exercisesRepository;

  ExercisesUseCase(this.exercisesRepository);

  Future<void> call(ExercisesEntity exercise) {
    return exercisesRepository.createExercise(exercise);
  }




}