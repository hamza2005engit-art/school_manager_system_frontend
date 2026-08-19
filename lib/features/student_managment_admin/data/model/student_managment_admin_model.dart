import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';

class StudentManagmentAdminModel extends StudentManagmentAdminEntity {

  StudentManagmentAdminModel({
    required super.id,
    required super.studentId,
    required super.studentStatus,
    required super.fullName,
    required super.phone,
    required super.profileImage,
    required super.studentDbId
  });

  factory StudentManagmentAdminModel.fromJson(Map<String, dynamic> json) {
    return StudentManagmentAdminModel(
      id: json['id'].toString(),
      studentDbId: json['student_id'].toString(), // ← أضف
      studentId: json['student']['student_number'].toString(),
      studentStatus: json['status'] ?? '',
      fullName: json['student']['user']['full_name'] ?? '',
      phone: json['student']['user']['phone'] ?? '',
      profileImage: json['student']['user']['profile_image'],
    );
  }
}
