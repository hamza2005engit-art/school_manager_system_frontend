import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_connect/connect.dart';

class FcmService extends GetConnect {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    print('FCM: requesting permission...');
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('FCM: permission status = ${settings.authorizationStatus}');

    try {
      final token = await _messaging.getToken();
      print('FCM: token = $token');
      if (token != null) {
        await _sendTokenToBackend(token);
      } else {
        print('FCM: token is NULL — Play Services issue likely');
      }
    } catch (e, st) {
      print('FCM: getToken() threw error: $e');
    }

    _messaging.onTokenRefresh.listen(_sendTokenToBackend);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.snackbar(
        message.notification?.title ?? '',
        message.notification?.body ?? '',
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Get.toNamed('/notifications');
    });
  }

  Future<void> _sendTokenToBackend(String token) async {
    try {
      final accessToken = GetStorage().read('token');
      print('FCM: sending token to backend, authToken exists = ${accessToken != null}');
      final response = await post(
        'http://10.0.2.2:8000/api/v1/updateFcmToken',
        {'fcm_token': token},
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      print('FCM: backend response status = ${response.statusCode}, body = ${response.body}');
    } catch (e) {
      print('FCM: token update failed: $e');
    }
  }
}