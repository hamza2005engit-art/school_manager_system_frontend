import 'package:student_project1/features/home/domain/entities/marks_student_user.dart';
import 'package:student_project1/features/home/domain/entities/notifincatins_user.dart';

import '../entities/addnotifincation_user.dart';
import '../entities/exercises_user.dart';
import '../entities/fees_user.dart';

abstract class HomeRepository {
  Future<NotifincationUser> notifincation( NotifincationUser notifincationuser);
  Future<AddNotifincationUser> addnotifincation( AddNotifincationUser addnotifincationuser);
  Future<MarksStudentUser> marksstudent( MarksStudentUser marksstudent);
  Future<ExercisesUser> exercises( ExercisesUser exercises);
  Future<FeesUser> feesuser( FeesUser feesuser);
  Future<List<NotifincationUser>> getNotifications();
}