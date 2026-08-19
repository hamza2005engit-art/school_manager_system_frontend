import 'package:student_project1/features/home_page/domain/entities/attendance_entity.dart';

import '../../data/model/attendance_model.dart';

abstract class AttendanceRepository {

  Future<AttendanceModel> getAttendance();
}