class StudentManagmentEntity {
  String id;
  String studentId; //رقم الطالب بالمدرسة
  String fullName;
  String phone;
  String? profileImage;
  String section;
  String grade;
  String email;
  String location;
  String? materialId;
  String? typeMark;
  String? mark;
  String? finalMark;
  String? testMark;

  StudentManagmentEntity({
  required this.id,
  required this.studentId,
  required this.fullName,
  required this.phone,
  required this.profileImage,
    required this.section,
    required this.grade,
    required this.location,
    required this.email,
     this.mark,
     this.typeMark,
     this.materialId,
    this.testMark,
    this.finalMark
  });

}