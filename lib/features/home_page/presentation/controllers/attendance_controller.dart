import 'package:get/get.dart';
import '../../domain/usecases/attendance_usecase.dart';
import '../../data/model/attendance_model.dart';

class AttendanceController extends GetxController {
  final AttendanceUseCase attendanceUseCase;

  AttendanceController(this.attendanceUseCase);

  var isLoading = false.obs;
  var attendanceRates = <AttendanceData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAttendanceRate();
  }

  Future<void> fetchAttendanceRate() async {
    try {
      isLoading.value = true;

      final AttendanceModel result = await attendanceUseCase.call();
print('result ${result}');
      if (result.success) {
        attendanceRates.assignAll(result.data);
      } else {
        Get.snackbar("تنبيه", "فشل جلب البيانات من السيرفر");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل معدل الحضور: $e");
    } finally {
      isLoading.value = false;
    }
  }
}