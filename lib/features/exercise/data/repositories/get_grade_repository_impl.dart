import 'package:student_project1/features/exercise/data/datasources/get_grade_remote_data.dart';
import 'package:student_project1/features/exercise/domain/entity/get_grade_entity.dart';
import 'package:student_project1/features/exercise/domain/repository/get_grade_repository.dart';

class GradeRepositoryImpl extends GetGradeRepository {

  final GradeRemoteDataSource gradeRemoteDataSource;
  GradeRepositoryImpl(this.gradeRemoteDataSource);

  @override
  Future<List<GradeEntity>> get_grade() {
    return gradeRemoteDataSource.get_grade();
  }


}