import '../../domain/entity/student_managment_entity.dart';

class StudentManagmentModel extends StudentManagmentEntity {
  StudentManagmentModel({
    required super.id,
    required super.studentId,
    required super.fullName,
    required super.phone,
    required super.profileImage,
    required super.section,
    required super.grade,
    required super.location,
    required super.email,
    super.finalMark,
    super.testMark,
    super.materialId,
    super.mark,
    super.typeMark,
  });

  factory StudentManagmentModel.fromJson(Map<String, dynamic> json) {
    final userMap = json['user'] as Map<String, dynamic>? ?? {};
    final sectionMap = json['section'] as Map<String, dynamic>? ?? {};
    final marksList = json['marks'] as List? ?? [];

    // نقرأ material_id من مستوى الطالب مباشرة (دايمًا موجودة الآن)
    String? extractedMaterialId = json['material_id']?.toString();
    String? finalScore;
    String? testScore;

    for (var markItem in marksList) {
      if (markItem is Map<String, dynamic>) {
        String type = markItem['type']?.toString() ?? '';
        if (type == 'final') {
          finalScore = markItem['score']?.toString();
        } else if (type == 'test') {
          testScore = markItem['score']?.toString();
        }
      }
    }

    return StudentManagmentModel(
      id: json['id']?.toString() ?? '',
      studentId: json['student_number']?.toString() ?? '',
      fullName: userMap['full_name'] ?? '',
      phone: userMap['phone'] ?? '',
      email: userMap['email'] ?? '',
      location: userMap['location'] ?? '',
      profileImage: userMap['profile_image'] ?? '',
      section: sectionMap['section_number']?.toString() ?? '',
      grade: sectionMap['study_stage_id']?.toString() ?? '',
      materialId: extractedMaterialId ?? '',
      finalMark: finalScore ?? '',
      testMark: testScore ?? '',
      typeMark: marksList.isNotEmpty ? marksList[0]['type']?.toString() : '',
      mark: marksList.isNotEmpty ? marksList[0]['score']?.toString() : '',
    );
  }
}