import 'package:student_project1/features/exercise/domain/entity/get_grade_entity.dart';

class GradeModel extends GradeEntity {

  GradeModel({required super.id, required super.stageNumber});

  factory GradeModel.fromJson(Map<String,dynamic> json) {

    return GradeModel(
        id: json['id'] != null ? json['id'] as int : null,
        stageNumber: json['stage_number'] != null ? json['stage_number'] as int : null
    );
  }
}
