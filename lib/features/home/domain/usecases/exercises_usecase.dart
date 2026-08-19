

import 'package:student_project1/features/home/domain/entities/exercises_user.dart';

import '../repositories/home_repository.dart';

class ExercisesUsecase {
  final HomeRepository repository;

  ExercisesUsecase(this.repository);

  Future<ExercisesUser> call(ExercisesUser exercisesuser) {
    return  repository.exercises(exercisesuser);
  }
}