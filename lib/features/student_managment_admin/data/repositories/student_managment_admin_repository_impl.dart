import 'package:student_project1/features/student_managment_admin/data/datasources/student_managment_admin_data_source.dart';
import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';
import 'package:student_project1/features/student_managment_admin/domain/repository/student_managment_admin_repository.dart';

class StudentManagmentAdminRepositoryImpl extends StudentManagmentAdminRepository {

  final StudentManagmentAdminRemoteDataSource studentManagmentAdminRemoteDataSource;
  StudentManagmentAdminRepositoryImpl(this.studentManagmentAdminRemoteDataSource);

  @override
  Future<List<StudentManagmentAdminEntity>> getStudent(int section, int grade) {
    print('ddfs');
    return studentManagmentAdminRemoteDataSource.getStudent(section, grade);
  }

  @override
  Future<void> takeAttendance({
    required int sectionId,
    required List<Map<String, dynamic>> students,
  }) {
    return studentManagmentAdminRemoteDataSource.takeAttendance(
      sectionId: sectionId,
      students: students,
    );
  }
}