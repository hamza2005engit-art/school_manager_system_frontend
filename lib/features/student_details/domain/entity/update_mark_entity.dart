class CreateMarkEntity {
  final String studentId;
  final String materialId;
  final String type; // exercise, test, final
  final int score;

  CreateMarkEntity({
    required this.studentId,
    required this.materialId,
    required this.type,
    required this.score,
  });
}