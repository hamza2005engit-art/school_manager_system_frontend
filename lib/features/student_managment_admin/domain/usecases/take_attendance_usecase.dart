// take_attendance_usecase.dart
import 'package:student_project1/features/student_managment_admin/domain/repository/student_managment_admin_repository.dart';

class TakeAttendanceUseCase {
  final StudentManagmentAdminRepository repository;
  TakeAttendanceUseCase(this.repository);

  Future<void> call({
    required int sectionId,
    required List<Map<String, dynamic>> students,
  }) {
    return repository.takeAttendance(
      sectionId: sectionId,
      students: students,
    );
  }
}