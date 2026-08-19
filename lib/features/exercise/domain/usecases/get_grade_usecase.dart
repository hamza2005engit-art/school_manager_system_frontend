import 'package:student_project1/features/exercise/domain/entity/get_grade_entity.dart';
import 'package:student_project1/features/exercise/domain/repository/get_grade_repository.dart';

class GradeUseCase {

  final GetGradeRepository gradeRepository;

  GradeUseCase(this.gradeRepository);

  Future<List<GradeEntity>> call() {
    return gradeRepository.get_grade();
  }
}