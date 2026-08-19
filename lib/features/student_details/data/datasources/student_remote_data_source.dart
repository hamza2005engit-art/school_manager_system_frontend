import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/student_model.dart';


class StudentRemoteDataSource {

  Future<StudentModel> getStudentDetails() async {
    final response = await http.get(
        Uri.parse('https://your-api.com/api/student')
    );

    if(response == 200) {
      final data = jsonDecode(response.body);

      return StudentModel.fromJson(data);
    } else {
      throw Exception("Failed to load student details");

    }
  }

}