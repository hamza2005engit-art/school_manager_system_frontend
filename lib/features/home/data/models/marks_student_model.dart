import 'package:student_project1/features/home/domain/entities/marks_student_user.dart';



class MarksStudentModel extends MarksStudentUser {
  MarksStudentModel({

    required super.exersices,
    required super.finale,
    required super.subject,
    required super.test,
    required super.total,
    required super.total_academi,
    required super.degree,
    required super.class_rank,
    super.token
  });

  factory MarksStudentModel.fromJson(Map<String, dynamic> json) {
    return MarksStudentModel(
      exersices: json['exersices'],
      finale: json['finale'],
      subject: json['subject'],
      test: json['test'],
      total: json['total'],
      total_academi: json['total_academi'],
      degree: json['degree'],
      class_rank: json['class_rank'],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'exersices': exersices,
      'finale': finale,
      'subject': subject,
      'test': test,
      'total': total,
      'total_academi': total_academi,
      'degree': degree,
      'class_rank': class_rank,

    };
  }

}