class AddNotifincationUser {
  final String title;
  final String content;
  final String grade;
  final String? token;///////////////

  AddNotifincationUser({
    required this.title,
    required this.grade,
    required this.content,
    this.token//////////////
  });
}