import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../model/schedule_model.dart';
import 'package:intl/intl.dart';

class ScheduleRemoteDataSource {

  final day = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
  final token = GetStorage().read('token');
  Future<List<ScheduleModel>> getSchedule() async {
    print('token: ${token}');
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/my_schedule/$day'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);

      return (data['data'] as List)
          .map((e) => ScheduleModel.fromMap(e))
          .toList();

    } else {
      throw Exception("Failed to load schedule ${response.statusCode}-${response.body}");
    }
  }
}