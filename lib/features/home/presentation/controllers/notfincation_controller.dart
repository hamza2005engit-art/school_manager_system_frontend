import 'package:get/get.dart';
import '../../domain/entities/notifincatins_user.dart';
import '../../domain/usecases/notification_usecase.dart';

class NotfincationController extends GetxController {
  final NotifincationUsecase notifincationusercase;

  NotfincationController(this.notifincationusercase);

  final isLoading = false.obs;
  final notifications = <NotifincationUser>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    isLoading.value = true;
    try {
      final result = await notifincationusercase.getAll();
      notifications.value = result;
    } catch (e) {
      Get.snackbar('خطأ', 'فشل تحميل الإشعارات');
      print('fetchNotifications error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}