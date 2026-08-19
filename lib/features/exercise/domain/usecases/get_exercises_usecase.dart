import 'package:student_project1/features/exercise/domain/entity/exercises_entity.dart';

import '../repository/exercises_repository.dart';

class GetExercisesUseCase {

  final ExerciseRepository exercisesRepository;

  GetExercisesUseCase(this.exercisesRepository);

  Future<List<ExercisesEntity>> call() {
    return exercisesRepository.getExercises();
  }
}