

import '../entity/exercises_entity.dart';

abstract class ExerciseRepository {

  Future<void> createExercise(ExercisesEntity exercise);

  Future<List<ExercisesEntity>> getExercises();

  Future<void> deleteExercise(int id);

  Future<List<ExercisesEntity>> getExercisesForStudent();
}