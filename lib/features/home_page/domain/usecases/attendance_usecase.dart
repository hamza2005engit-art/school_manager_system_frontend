import 'package:student_project1/features/home_page/domain/entities/attendance_entity.dart';
import 'package:student_project1/features/home_page/domain/repositories/attendance_repository.dart';

import '../../data/model/attendance_model.dart';

class AttendanceUseCase {

  final AttendanceRepository attendanceRepository;

  AttendanceUseCase(this.attendanceRepository);

  Future<AttendanceModel> call() {
    return attendanceRepository.getAttendance();
  }
}