import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/exercises_model.dart';

class ExercisesForStudentRemoteDataSource {

  Future<ExercisesForStudentModel> getExercisesForStudent() async {
    final response = await http.get(Uri.parse(
  'https://darkseagreen-salamander-685564.hostingersite.com/api/exercises'
  )
  );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ExercisesForStudentModel.fromJson(data);
    } else {
      throw Exception("Failed to load exercises for student");
    }
}
}