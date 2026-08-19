import 'package:student_project1/features/student_management/domain/entity/student_managment_entity.dart';
import 'package:student_project1/features/student_management/domain/repository/student_mangment_repository.dart';

class StudentManagmentUseCase {

  final StudentManagmentRepository studentManagmentRepository;

  StudentManagmentUseCase(this.studentManagmentRepository);

  Future<List<StudentManagmentEntity>> call() {
    return studentManagmentRepository.getStudents();
  }
}