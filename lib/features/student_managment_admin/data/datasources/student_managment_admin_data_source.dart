import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/student_managment_admin/data/model/student_managment_admin_model.dart';
import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';

class StudentManagmentAdminRemoteDataSource {
  final token = GetStorage().read('token');

  Future<List<StudentManagmentAdminModel>> getStudent(int section, int grade) async {
    print('API CALLED: $section - $grade');

    try {
      final url = 'https://darkseagreen-salamander-685564.hostingersite.com/api/v1/attendance/$section/$grade';
      print('URL: $url');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');

      final data = jsonDecode(response.body);

      // التحقق من أن رمز الاستجابة ناجح وحقل البيانات موجود
      if (response.statusCode == 200 && data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => StudentManagmentAdminModel.fromJson(e))
            .toList();
      } else {
        final errorMessage = data['message'] ?? 'فشل في جلب بيانات الطلاب';
        throw Exception(errorMessage);
      }

    } catch (e) {
      print('❌ ERROR: $e');
      rethrow;
    }
  }

  Future<void> takeAttendance({
    required int sectionId,
    required List<Map<String, dynamic>> students,
  }) async {
    final url = 'https://darkseagreen-salamander-685564.hostingersite.com/api/v1/take_attendance/bulk';

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'section_id': sectionId,
        'students': students,
      }),
    );

    if (response.statusCode != 200) {
      print('Save Error: ${response.body}');
      throw Exception('Failed to save attendance');
    }
  }
}