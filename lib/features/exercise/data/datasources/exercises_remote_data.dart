import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/exercise/data/model/exercises_model.dart';


class ExercisesRemoteDataSource {

  final token = GetStorage().read('token');

  /// 📌 Create Exercise
  Future<void> createExercise({required String title, required String content, required String date, required int studyStageId,}) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/v1/exercises"),
      body:  jsonEncode({
        "title": title,
        "content": content,
        "date": date,
        "study_stage_id": studyStageId,
      }),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}'
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to create exercise: ${response.body}");
    }
  }

  Future<List<ExercisesModel>> getExercises() async {

    final uri = Uri.parse("http://10.0.2.2:8000/api/v1/teacher/exercises");

    final response = await http.get(uri, headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer ${token}'
    });

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body) as List;


      return data
          .map((e) => ExercisesModel.fromJson(e))
          .toList();

    } else {
      print('error: ${response.statusCode}_${response.body}');
      throw Exception("Failed to load exercises");
    }
  }
  Future<List<ExercisesModel>> getExercisesForStudent() async {

    final uri = Uri.parse("http://10.0.2.2:8000/api/v1/student/exercises");

    final response = await http.get(uri, headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer ${token}'
    });

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body) as List;


      return data
          .map((e) => ExercisesModel.fromJson(e))
          .toList();

    } else {
      print('error: ${response.statusCode}_${response.body}');
      throw Exception("Failed to load exercises");
    }
  }

  Future<void> deleteExercise(int id) async{
     final response = await http.delete(
       Uri.parse('http://10.0.2.2:8000/api/v1/exercises/$id'),
         headers: {
           "Accept": "application/json",
           'Authorization': 'Bearer ${token}'
         }
     );

     if(response.statusCode != 200) {
       throw Exception("Failed to delete exercise: ${response.body}");
     }
  }

  
}