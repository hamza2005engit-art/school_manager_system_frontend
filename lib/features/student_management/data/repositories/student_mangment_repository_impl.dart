import 'package:student_project1/features/student_management/domain/entity/student_managment_entity.dart';
import 'package:student_project1/features/student_management/domain/repository/student_mangment_repository.dart';

import '../datasource/student_managment_datasource.dart';

class StudentMangmentRepositoryImpl extends StudentManagmentRepository {
  final StudentManagmentRemoteDataSource studentManagmentRemoteDataSource;

  StudentMangmentRepositoryImpl(this.studentManagmentRemoteDataSource);

  @override
  Future<List<StudentManagmentEntity>> getStudents() {
    return studentManagmentRemoteDataSource.getStudents();
  }
}