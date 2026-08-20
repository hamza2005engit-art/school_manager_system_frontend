import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/attendance_model.dart';

class AttendanceRemoteDataSource {
  final token = GetStorage().read('token');

  Future<AttendanceModel> getAttendance() async {
    final url = Uri.parse(
      'https://darkseagreen-salamander-685564.hostingersite.com/api/v1/student/attendance/rate',
    );

    print('================ ATTENDANCE RATE ================');
    print('URL: $url');
    print('TOKEN EXISTS: ${token != null && token.toString().isNotEmpty}');

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
      print('==================================================');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('PARSED DATA: $data');

        return AttendanceModel.fromJson(data);
      } else {
        throw Exception(
          'Failed Load Attendance Rate '
              '${response.statusCode}_${response.body}',
        );
      }
    } catch (e) {
      print('❌ ATTENDANCE API ERROR: $e');
      rethrow;
    }
  }
}