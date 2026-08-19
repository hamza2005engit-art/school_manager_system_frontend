import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/student_management/data/model/student_managment_model.dart';

class StudentManagmentRemoteDataSource {

  final token = GetStorage().read('token');

  Future<List<StudentManagmentModel>> getStudents() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/teacher/students'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return (data['students'] as List)
          .map((e)=> StudentManagmentModel.fromJson(e)).toList();
    } else {
      print('error ${response.statusCode}_${response.body}');
      return [];
    }

  }

}