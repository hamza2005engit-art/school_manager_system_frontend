


import 'package:student_project1/features/home/domain/entities/marks_student_user.dart';

import '../repositories/home_repository.dart';

class MarksStudentUsecase {
  final HomeRepository repository;

  MarksStudentUsecase(this.repository);

  Future<MarksStudentUser> call(MarksStudentUser marksstudentuser) {
    return  repository.marksstudent(marksstudentuser);
  }
}