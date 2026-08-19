import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';

abstract class StudentManagmentAdminRepository {

  Future<List<StudentManagmentAdminEntity>> getStudent(int section,int grade);
  Future<void> takeAttendance({
    required int sectionId,
    required List<Map<String, dynamic>> students,
  });
}