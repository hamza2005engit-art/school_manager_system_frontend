import 'package:student_project1/features/home_page/domain/entities/attendance_entity.dart';
import 'package:student_project1/features/home_page/domain/repositories/attendance_repository.dart';

import '../datasources/attendance_datasource.dart';
import '../model/attendance_model.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {

  final AttendanceRemoteDataSource attendanceRemoteDataSource;

  AttendanceRepositoryImpl(this.attendanceRemoteDataSource);

  @override
  Future<AttendanceModel> getAttendance() async {
    return await attendanceRemoteDataSource.getAttendance();
  }

}