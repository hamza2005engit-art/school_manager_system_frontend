



import 'package:student_project1/features/home/domain/entities/exercises_user.dart';
import 'package:student_project1/features/home/domain/entities/notifincatins_user.dart';

class ExercisesModel extends ExercisesUser {
  ExercisesModel({

    required super.date,
    required super.content,
    required super.title,
    required super.grade,
    super.token
  });

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return ExercisesModel(
      date: json['date'],
      content: json['content'],
      title: json['title'],
      grade: json['grade'],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'content': content,
      'title': title,
      'grade':grade,

    };
  }

}