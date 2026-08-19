class StudentManagmentAdminEntity {
  String id;
  String studentDbId;
  String studentId;
  String studentStatus;
  String fullName;
  String phone;
  String? profileImage;

  StudentManagmentAdminEntity({
    required this.id,
    required this.studentDbId,
    required this.studentId,
    required this.studentStatus,
    required this.fullName,
    required this.phone,
    required this.profileImage,
  });
}