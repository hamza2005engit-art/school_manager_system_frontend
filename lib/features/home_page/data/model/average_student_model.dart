import '../../domain/entities/average_student_entity.dart';

class AverageStudentModel extends AverageStudentEntity {
  AverageStudentModel({
    required super.materialId,
    required super.materialName,
    super.teacherName,
    required super.exercise,
    required super.test,
    required super.finalMark,
    required super.total,
    required super.average,
  });

  factory AverageStudentModel.fromJson(Map<String, dynamic> json) {
    return AverageStudentModel(
      materialId: json['material_id'] ?? 0,
      materialName: json['material_name'] ?? '',
      teacherName: json['teacher_name'],
      exercise: json['exercise'] ?? 0,
      test: json['test'] ?? 0,
      finalMark: json['final'] ?? 0,
      total: json['total'] ?? 0,
      average: json['average'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'material_id': materialId,
      'material_name': materialName,
      'teacher_name': teacherName,
      'exercise': exercise,
      'test': test,
      'final': finalMark,
      'total': total,
      'average': average,
    };
  }
}