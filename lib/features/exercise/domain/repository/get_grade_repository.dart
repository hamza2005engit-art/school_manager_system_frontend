import 'package:student_project1/features/exercise/domain/entity/get_grade_entity.dart';

abstract class GetGradeRepository {

  Future<List<GradeEntity>> get_grade();
}