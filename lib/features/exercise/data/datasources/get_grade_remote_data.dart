import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/exercise/data/model/get_grade_model.dart';

class GradeRemoteDataSource {

  final token = GetStorage().read('token');
  Future<List<GradeModel>> get_grade() async{

    final response = await http.get(
        Uri.parse("https://darkseagreen-salamander-685564.hostingersite.com/api/v1/get_study_stage"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      print("statuscode ${response.statusCode}");

      return (data['data'] as List)
          .map((e)=> GradeModel.fromJson(e)).toList();
    } else {
      print('Error: ${response.statusCode}_${response.body}');
      throw Exception("Fiald load grade");

    }
  }
}