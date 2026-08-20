import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:student_project1/features/student_management/data/model/student_managment_model.dart';

class StudentManagmentRemoteDataSource {
  final token = GetStorage().read('token');

  Future<List<StudentManagmentModel>> getStudents() async {
    final url = Uri.parse(
      'https://darkseagreen-salamander-685564.hostingersite.com/api/v1/teacher/students',
    );

    print('================ TEACHER STUDENTS ================');
    print('URL: $url');
    print(
      'TOKEN EXISTS: ${token != null && token.toString().isNotEmpty}',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');
      print('===================================================');

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to load students: '
              '${response.statusCode} - ${response.body}',
        );
      }

      final data = jsonDecode(response.body);

      print('DECODED DATA: $data');

      if (data['students'] == null) {
        throw Exception(
          'Response does not contain "students" field',
        );
      }

      if (data['students'] is! List) {
        throw Exception(
          '"students" is not a List',
        );
      }

      final students = (data['students'] as List)
          .map(
            (e) => StudentManagmentModel.fromJson(
          Map<String, dynamic>.from(e),
        ),
      )
          .toList();

      print('STUDENTS COUNT: ${students.length}');

      return students;
    } catch (e, stackTrace) {
      print('❌ ERROR GET STUDENTS: $e');
      print(stackTrace);
      rethrow;
    }
  }
}