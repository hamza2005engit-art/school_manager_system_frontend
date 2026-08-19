import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/library/data/model/library_model.dart';

class LibraryRemoteDataSource {
  final token = GetStorage().read('token');
  
  Future<List<LibraryModel>> getLibrary() async{
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/v1/books"),
      headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${token}',
    },
    );
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return (data['books'] as List).map(
          (e)=> LibraryModel.fromJson(e)
      ).toList();
    } else {
      throw Exception("Faild Load Library ${response.statusCode}_${response.body}");
    }
  }
}