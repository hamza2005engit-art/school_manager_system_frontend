

import '../../domain/entity/exercies_for_student_entity.dart';
import '../../domain/repositories/exercies_for_student_repostory.dart';
import '../datasources/exercises_for_student_remote_data.dart';

class ExercisesForStudentRepositoryImpl extends ExerciesForStudentRepository {

  final ExercisesForStudentRemoteDataSource exercisesForStudentRemoteDataSource;

  ExercisesForStudentRepositoryImpl(this.exercisesForStudentRemoteDataSource);

  @override
  Future<ExerciesForStudentEntity> getExerciesForStudent() {

   return exercisesForStudentRemoteDataSource.getExercisesForStudent();

  }


}

