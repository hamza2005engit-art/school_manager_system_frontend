import '../../domain/entity/exercises_entity.dart';

class ExercisesModel extends ExercisesEntity {
  ExercisesModel({
    required super.id,
    required super.title,
    required super.content,
    required super.date,
    //required id,
    required super.stageNumber,
  //  required super.teacherId,
    //required super.created_at,
  });

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return ExercisesModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
      stageNumber: json['stage_number'],
     // teacherId: json['teacher_id'],
      //created_at: json['created_at'],
    );
  }
}