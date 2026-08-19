import 'package:student_project1/features/student_management/domain/entity/student_managment_entity.dart';

abstract class StudentManagmentRepository {

  Future<List<StudentManagmentEntity>> getStudents();
}