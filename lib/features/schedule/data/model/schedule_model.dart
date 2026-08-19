
import '../../domain/entity/schedul_entity.dart';

class ScheduleModel extends ScheduleEntity {
  ScheduleModel({
    required super.id,
    required super.period,
    required super.start_time,
    required super.end_time,
    required super.material,
    super.teacher,
    super.section,
    super.studyStage,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'].toString(),
      period: json['period'],
      start_time: json['start_time'],
      end_time: json['end_time'],
      material: json['material'],
      teacher: json['teacher'],
      section: json['section']?.toString(),
      studyStage: json['study_stage']?.toString(),
    );
  }

  static List<ScheduleModel> fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List;

    return list
        .map((item) => ScheduleModel.fromMap(item))
        .toList();
  }
}