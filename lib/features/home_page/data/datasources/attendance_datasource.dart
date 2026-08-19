import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/attendance_model.dart';

class AttendanceRemoteDataSource {

  final token = GetStorage().read('token');

  Future<AttendanceModel> getAttendance() async {

    final response = await http.get(
      Uri.parse(
       'http://10.0.2.2:8000/api/v1/student/attendance/rate'
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if(response.statusCode == 200) {

      final data = jsonDecode(response.body);
      return AttendanceModel.fromJson(data);
    }   else {
      throw Exception("Faild Load Attendance Rate ${response.statusCode}_${response.body}");
    }
  }
}