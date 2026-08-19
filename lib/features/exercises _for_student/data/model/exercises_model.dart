import '../../domain/entity/exercies_for_student_entity.dart';

class ExercisesForStudentModel extends ExerciesForStudentEntity {


  ExercisesForStudentModel({required super.name, required super.title, required super.date, required super.idStudent, required super.exercies, required super.image, required super.mark});

  factory ExercisesForStudentModel.fromJson(Map<String, dynamic> json) {

    return ExercisesForStudentModel(
        name: json['name'],
        title: json['title'],
        date: json['date'],
        idStudent: json['idStudent'],
        exercies: json['exercies'],
        image: json['image'],
        mark: json['mark']
    );

  }
}