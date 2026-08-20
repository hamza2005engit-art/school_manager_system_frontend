import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:student_project1/features/auth/data/models/first_forgetpassword_model.dart';
import 'package:student_project1/features/auth/data/models/forgetpassword_model.dart';
import 'package:student_project1/features/auth/domain/entities/first_forgetpassword_user.dart';
import 'package:student_project1/features/auth/domain/entities/register_user.dart';

import '../models/registeruser_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<RegisterUserModel> register(RegisterUser registeruser);
  Future<ForgotPasswordModel> forgotPassword(String email);
  Future<ForgetPasswordModel> resetPassword(
    String email,
    String otp,
    String password,
    String passwordConfirmation,
  );
}

class AuthRemoteDataSourceImpl extends GetConnect
    implements AuthRemoteDataSource {
  final String baseUrl = "https://darkseagreen-salamander-685564.hostingersite.com/api/v1";
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      print("Base URL = ${httpClient.baseUrl}");

      final response = await post(
        '/login',
        {
          'email': email,
          'password': password,
        },
        headers: {
          'Accept': 'application/json',
        },
      );

      print("========== RESPONSE ==========");
      print("StatusCode : ${response.statusCode}");
      print("StatusText : ${response.statusText}");
      print("HasError   : ${response.status.hasError}");
      print("Body       : ${response.body}");
      print("Headers    : ${response.headers}");
      print("==============================");

      if (response.status.hasError) {
        throw Exception(
          response.body?['message'] ??
              response.body?['error'] ??
              response.statusText ??
              "Login Failed",
        );
      }

      if (response.body == null) {
        throw Exception("Response body is null");
      }

      return UserModel.fromJson(response.body);

    } catch (e, stackTrace) {
      print("========== EXCEPTION ==========");
      print("ERROR      : $e");
      print("STACKTRACE :");
      print(stackTrace);
      print("==============================");

      rethrow;
    }
  }

  @override
  Future<RegisterUserModel> register(RegisterUser user) async {

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));

    // إضافة الحقول النصية (يجب أن تطابق الـ Request في Laravel)
    request.fields.addAll({
      'full_name': user.fullName,
      'email': user.email,
      'phone': user.phone,
      'password': user.password,
      'password_confirmation': user.passwordConfirmation,
      'role': user.role,
      'location': user.location,
    });

    // إضافة الصورة
    if (user.profileImagePath.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_image', // المفتاح المتوقع في Laravel
          user.profileImagePath,
        ),
      );
    }

    request.headers.addAll({'Accept': 'application/json'});

    print("========== REGISTER REQUEST ==========");
    print("URL    : ${request.url}");
    print("FIELDS : ${request.fields}");
    print("FILES  : ${request.files.length}");
    print("======================================");

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print("========== REGISTER RESPONSE ==========");
    print("STATUS : ${response.statusCode}");
    print("BODY   : ${response.body}");
    print("HEADERS: ${response.headers}");
    print("======================================");

    if (response.statusCode == 201) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final errorData = json.decode(response.body);
      throw Exception(errorData['message'] ?? "Registration Failed");
    }
  }

  @override
  Future<ForgotPasswordModel> forgotPassword(String email) async {
    final response = await post(
      '/forget_password',
      {'email': email},
      headers: {'Accept': 'application/json'},
    );

    if (response.status.hasError) {
      throw Exception(response.body?['message'] ?? "Error");
    }

    return ForgotPasswordModel.fromJson(response.body);
  }

  @override
  Future<ForgetPasswordModel> resetPassword(
    String email,
    String otp,
    String password,
    String password_confirmation,
  ) async {
    // استخدم baseUrl بدلاً من الرابط الوهمي
    final response = await post(
      '/reset_password',
      {
        'email': email,
        'otp': otp,
        'password': password,
        'password_confirmation': password_confirmation,
      },
      headers: {'Accept': 'application/json'},
    );

    if (response.status.hasError) {
      throw Exception(response.body?['message'] ?? "Password Reset Failed");
    } else {
      return ForgetPasswordModel.fromJson(response.body);
    }
  }
}
