


import 'package:student_project1/features/home/data/models/fees_model.dart';
import 'package:student_project1/features/home/domain/entities/exercises_user.dart';
import 'package:student_project1/features/home/domain/entities/fees_user.dart';
import 'package:student_project1/features/home/domain/entities/marks_student_user.dart';
import 'package:student_project1/features/home/domain/entities/notifincatins_user.dart';

import '../../domain/entities/addnotifincation_user.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NotifincationUser> notifincation
      (NotifincationUser notifincationuser) async{
    return await remoteDataSource.notifincation(
      notifincationuser.date,
      notifincationuser.title,
      notifincationuser.content,

    );

  }
  @override
  Future<AddNotifincationUser> addnotifincation
      (AddNotifincationUser addnotifincationuser) async{
    return await remoteDataSource.addnotifincation(
      addnotifincationuser.grade,
      addnotifincationuser.title,
      addnotifincationuser.content,

    );

  }

  @override
  Future<MarksStudentUser> marksstudent
      (MarksStudentUser marksstudentuser) async{
    return await remoteDataSource.marksstudent(
        marksstudentuser.total_academi,
        marksstudentuser.class_rank,
        marksstudentuser.subject,
        marksstudentuser.degree,
        marksstudentuser.test,
        marksstudentuser.finale,
        marksstudentuser.exersices,
        marksstudentuser.total,

    );

  }

  @override
  Future<ExercisesUser> exercises
      (ExercisesUser exercisesuser) async{
    return await remoteDataSource.exercises(
      exercisesuser.date,
      exercisesuser.title,
      exercisesuser.content,
        exercisesuser.grade

    );

  }


  @override
  Future<FeesModel> feesuser
      (FeesUser feesuser) async{
    return await remoteDataSource.feesuser(
        feesuser.toata_remaining,
        feesuser.total,
        feesuser.toata_fees,
        feesuser.paid

    );

  }
  // data/repositories/home_repository_impl.dart
  @override
  Future<List<NotifincationUser>> getNotifications() async {
    return await remoteDataSource.getNotifications();
  }
}
