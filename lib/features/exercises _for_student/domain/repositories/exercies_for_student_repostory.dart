import '../entity/exercies_for_student_entity.dart';

abstract class ExerciesForStudentRepository {

  Future<ExerciesForStudentEntity> getExerciesForStudent();
}