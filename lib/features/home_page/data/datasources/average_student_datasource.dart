import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/core/constants/app_constants.dart';
import '../model/average_student_model.dart';

class AverageStudentDataSource {
  final token = GetStorage().read('token');

  Future<List<AverageStudentModel>> getAverage() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/student/my-marks'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // استخراج القائمة marks وتحويل كل عنصر إلى AverageStudentModel
      final List marksList = data['marks'] ?? [];

      return marksList
          .map((item) => AverageStudentModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed Load Average Rate ${response.statusCode}_${response.body}");
    }
  }
}