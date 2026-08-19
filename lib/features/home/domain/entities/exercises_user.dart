class ExercisesUser {
  final String title;
  final DateTime date;
  final String content;
  final String grade;
  final String? token;///////////////

  ExercisesUser({
    required this.title,
    required this.date,
    required this.content,
    required this.grade,
    this.token//////////////
  });
}