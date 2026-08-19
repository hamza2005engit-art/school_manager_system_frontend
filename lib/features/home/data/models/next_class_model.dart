import 'package:student_project1/features/home/domain/entities/next_class.dart';

class NextClassModel extends NextClass{
  NextClassModel({required super.name, required super.teacher, required super.time});

  factory NextClassModel.fromJson(Map<String, dynamic> json) {
    return NextClassModel(
      name: json['name'],
      time: json['time'],
      teacher: json['teacher'],
    );
  }
}
