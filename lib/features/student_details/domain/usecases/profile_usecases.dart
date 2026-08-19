
import '../entity/student_entity.dart';
import '../repository/student_repository.dart';

class StudentUseCase {

  final StudentRepository studentRepository;

  StudentUseCase(this.studentRepository);

  Future<StudentEntity> call() {
    return studentRepository.getStudentDetails();
  }
}