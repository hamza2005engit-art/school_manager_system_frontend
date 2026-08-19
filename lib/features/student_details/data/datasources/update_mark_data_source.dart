import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/update_mark_model.dart';

class UpdateMarkRemoteDataSource {

  final token = GetStorage().read('token') ?? '';

  Future<bool> updateMark(UpdateMarkModel updateMarkModel) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/v1/teacher/marks/update-by-student'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'student_id': updateMarkModel.studentId,
          'material_id': updateMarkModel.materialId,
          'type': updateMarkModel.type,
          'score': updateMarkModel.score.toString(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print("السيرفر أعاد خطأ: ${response.body}");
        return false;
      }
    } catch (e) {
      print("حدث خطأ أثناء الاتصال: $e");
      return false;
    }
  }
}