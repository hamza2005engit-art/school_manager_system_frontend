class ScheduleEntity{
  String id;
  String period;
  String start_time;
  String end_time;
  String material;

  final String? teacher;
  final String? section;
  final String? studyStage;

  ScheduleEntity({
    required this.id,
    required this.period,
    required this.start_time,
    required this.end_time,
    required this.material,
    this.teacher,
    this.section,
    this.studyStage,
  });
}