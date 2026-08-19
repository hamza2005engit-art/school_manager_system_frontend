class AverageStudentEntity {
  final int materialId;
  final String materialName;
  final String? teacherName;
  final num exercise;
  final num test;
  final num finalMark;
  final num total;
  final num average;

  AverageStudentEntity({
    required this.materialId,
    required this.materialName,
    this.teacherName,
    required this.exercise,
    required this.test,
    required this.finalMark,
    required this.total,
    required this.average,
  });
}