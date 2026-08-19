import 'package:flutter/material.dart';
import '../../../../core/widget/custom_container_salary.dart';
import 'custom_academic_standing.dart';

Widget buildRoleSectionStudentAndTeachere({
  required String role,
  required double average,
  // required Map<String, dynamic> data,
  required String salary
}) {
  switch (role) {
    case "student":
      return CustomAcademicStanding(average: average,);

    case "teacher":
      return  CustomContainerSalary(salary: salary);

    case "admin":
      return CustomContainerSalary(salary: salary);

    default:
      return const SizedBox.shrink();
  }
}
