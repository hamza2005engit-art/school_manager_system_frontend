import 'package:student_project1/features/student_details/domain/entity/update_mark_entity.dart';

class UpdateMarkModel extends CreateMarkEntity {
  UpdateMarkModel({
    required super.studentId,
    required super.materialId,
    required super.type,
    required super.score,
  });
  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'material_id': materialId,
      'type': type,
      'score': score,
    };
  }
}
