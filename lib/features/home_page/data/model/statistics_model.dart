import 'package:student_project1/features/home_page/domain/entities/statistics.dart';

class StatisticsModel extends StatisticsEntity{

  StatisticsModel({super.countStudent,super.countTeacher});

  factory StatisticsModel.fromJson(Map<String,dynamic> json) {
    print('count teacher: ${json['students']}');
    return StatisticsModel(
      countStudent: json['students'] ?? 0,
      countTeacher: json['teachers'] ?? 0
    );
  }
}