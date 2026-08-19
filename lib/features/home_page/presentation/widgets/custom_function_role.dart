import 'package:flutter/material.dart';
import 'package:student_project1/features/home_page/presentation/widgets/student_attendance.dart';

import '../../../../core/widget/custom_container_work_schedule_student.dart';
import '../../../../core/widget/custom_container_work_schedule_teacher.dart';
import '../../data/model/attendance_model.dart';
Widget buildRoleSection({
  required String role,
  required String section,
  required String grade,
  required int numStudent,
  required int numTeacher,
  required List<AttendanceData> attendanceList,
}) {
  switch (role) {
    case "student":
      return CustomContainerWorkScheduleStudent(
        nameTeacher: "Mr. Smith",
        section: '2',
        durationOfTheSession: "9:45 AM - 10:30 AM",
      );

    case "teacher":
      return CustomContainerWorkScheduleTeacher(
        grade: grade,
        section: section,
        durationOfTheSession: "9:45 AM - 10:30 AM",
      );

    case "admin":
      return StudentAttendance(
        numStudents: numStudent,
        numTeachers: numTeacher,
        attendanceList: attendanceList,
      );

    default:
      return const SizedBox.shrink();
  }
}
