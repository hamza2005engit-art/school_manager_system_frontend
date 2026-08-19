import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/home_page/domain/entities/statistics.dart';
import '../model/statistics_model.dart';

class StatisticsRemoteDataSource {
  
  final token = GetStorage().read('token');
  
  Future<StatisticsModel> getContStudents() async{
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/admin/count/student',),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('count  ${data}');
      return StatisticsModel.fromJson(data);
    }
    else {
      throw Exception("Faild Load student count ${response.statusCode}_${response.body}");
    }
  }

  Future<StatisticsModel> getCountTeachcers() async{
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/admin/count/teacher',),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return StatisticsModel.fromJson(data);
    }
    else {
      throw Exception("Faild Load teacher count ${response.statusCode}_${response.body}");
    }
  }
}