class MarksStudentUser {
  final String subject;

  final int exersices;
  final int test;
  final int finale;
  final int total;

  final String total_academi;
  final String degree;
  final String class_rank;



  final String? token;///////////////

  MarksStudentUser({
    required this.subject,
    required this.test,
    required this.exersices,
    required this.finale,
    required this.total,
    required this.total_academi,
    required this.degree,
    required this.class_rank,
    this.token//////////////
  });
}