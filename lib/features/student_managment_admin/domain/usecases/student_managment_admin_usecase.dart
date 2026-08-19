import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';
import 'package:student_project1/features/student_managment_admin/domain/repository/student_managment_admin_repository.dart';

class StudentManagmentAdminUseCase {

  final StudentManagmentAdminRepository studentManagmentAdminRepository;
  StudentManagmentAdminUseCase(this.studentManagmentAdminRepository);

  Future<List<StudentManagmentAdminEntity>> call(int section,int grade) {
    return studentManagmentAdminRepository.getStudent(section, grade);
  }

}