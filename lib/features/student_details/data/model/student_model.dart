
import '../../domain/entity/student_entity.dart';

class StudentModel extends StudentEntity{
  StudentModel({required super.mark, required super.Final, required super.test, required super.exercis, required super.location, required super.phone, required super.email, required super.age});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        mark: json['mark'],
        Final: json['final'],
        test: json['test'],
        exercis: json['exercise'],
        location: json['location'],
        phone: json['phone'],
        email: json['email'],
        age: json['age']
    );
  }
}