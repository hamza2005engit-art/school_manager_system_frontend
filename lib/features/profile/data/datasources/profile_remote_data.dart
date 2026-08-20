import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import '../../../schedule/data/model/schedule_model.dart';
import 'package:http/http.dart' as http;

import '../model/profile_model.dart';


class ProfileRemoteDataSource {

  final token = GetStorage().read('token');

  Future<ProfileModel> getProfile() async {
    print("CALL API");

    final response = await http.get(
      Uri.parse('https://darkseagreen-salamander-685564.hostingersite.com/api/v1/me'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    print("STATUS CODE:");
    print(response.statusCode);

    print("BODY:");
    print(response.body);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      print("DECODED DATA:");
      print(data);

      return ProfileModel.fromJson(data);

    } else {

      throw Exception("Failed to load profile");

    }
  }
}