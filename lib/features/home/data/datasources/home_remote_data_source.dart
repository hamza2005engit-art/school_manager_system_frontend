import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/features/home/data/models/exercises_model.dart';
import 'package:student_project1/features/home/data/models/fees_model.dart';
import 'package:student_project1/features/home/data/models/marks_student_model.dart';
import 'package:student_project1/features/home/data/models/notifincatoin_model.dart';

import '../models/addnotifincation_model.dart';

abstract class HomeRemoteDataSource {

  Future<NotifincationModel> notifincation(
      DateTime date,
      String content,
      String title,

      );
  Future<AddNotifincationModel> addnotifincation(
      String grade,
      String content,
      String title,

      );
  Future<MarksStudentModel> marksstudent(
      String subject,
      String total_academi,
      String degree,
      String class_rank,
  int exersices,
   int test,
   int finale,
   int total,


      );
  Future<ExercisesModel> exercises(
      DateTime date,
      String content,
      String title,
      String grade,


      );
  Future<FeesModel> feesuser(
   int toata_fees,
   int total,
   int paid,
   int toata_remaining,


      );
  Future<List<NotifincationModel>> getNotifications();
}
  class HomeRemoteDataSourceImpl extends GetConnect implements HomeRemoteDataSource {
  @override
    Future<NotifincationModel> notifincation(
      DateTime date,
      String content,
      String title,
        ) async {
      final response = await post('http://your-laravel-api.com/api/Notifincation', {
        'date': date,
        'content': content,
        'title': title,


      });

      if (response.status.hasError) {
        throw Exception("Notifincation Failed");
      } else {
        return NotifincationModel.fromJson(response.body['data']);
      }
    }

  Future<AddNotifincationModel> addnotifincation(
      String grade,
      String content,
      String title,
      ) async {
    final accessToken = GetStorage().read('token');

    final response = await post(
      'http://10.0.2.2:8000/api/v1/addNotifincation',
      {
        'grade': grade,
        'content': content,
        'title': title,
      },
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.status.hasError) {
      throw Exception("Notifincation Failed");
    } else {
      return AddNotifincationModel.fromJson(response.body['data']);
    }
  }





  Future<MarksStudentModel> marksstudent(
      String subject,
      String total_academi,
      String degree,
      String class_rank,
      int exersices,
      int test,
      int finale,
      int total,
      ) async {
    final response = await post('http://your-laravel-api.com/api/mymarks', {
      'exersices': exersices,
      'finale': finale,
      'subject': subject,
      'test': test,
      'total': total,
      'total_academi': total_academi,
      'degree': degree,
      'class_rank': class_rank,


    });

    if (response.status.hasError) {
      throw Exception("Notifincation Failed");
    } else {
      return MarksStudentModel.fromJson(response.body['data']);
    }
  }



  Future<ExercisesModel> exercises(
      DateTime date,
      String content,
      String title,
      String grade,
      ) async {
    final response = await post('http://your-laravel-api.com/api/Exercises', {
      'date': date,
      'content': content,
      'title': title,
'grade':grade,

    });

    if (response.status.hasError) {
      throw Exception("Notifincation Failed");
    } else {
      return ExercisesModel.fromJson(response.body['data']);
    }
  }




  Future<FeesModel> feesuser(
      int toata_fees,
      int total,
      int paid,
      int toata_remaining,
      ) async {
    final response = await post('http://your-laravel-api.com/api/fees', {
      'toata_fees': toata_fees,
      'total': total,
      'paid': paid,
      'toata_remaining':toata_remaining,

    });

    if (response.status.hasError) {
      throw Exception("Notifincation Failed");
    } else {
      return FeesModel.fromJson(response.body['data']);
    }
  }
  @override
  Future<List<NotifincationModel>> getNotifications() async {
    final accessToken = GetStorage().read('token');
    final response = await get(
      'http://10.0.2.2:8000/api/v1/Notifincation',
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.status.hasError) {
      throw Exception("Failed to load notifications");
    }

    final List data = response.body['data'];
    return data.map((json) => NotifincationModel.fromJson(json)).toList();
  }
  }
