class NotifincationUser {
  final String title;
  final DateTime date;
  final String content;

  final String? token;///////////////

  NotifincationUser({
    required this.title,
    required this.date,
    required this.content,
    this.token//////////////
  });
}