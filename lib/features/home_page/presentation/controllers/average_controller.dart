import 'package:get/get.dart';
import 'package:student_project1/features/home_page/domain/entities/average_student_entity.dart';
import 'package:student_project1/features/home_page/domain/usecases/average_student_usecase.dart';

class AverageController extends GetxController {
  final AverageStudentUseCase averageStudentUseCase;
  AverageController(this.averageStudentUseCase);

  var isLoading = false.obs;
  var averageStudentList = <AverageStudentEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAverageStudent();
  }

  Future<void> fetchAverageStudent() async {
    try {
      isLoading.value = true;

      // جلب قائمة المواد مع معدلاتها
      final List<AverageStudentEntity> result = await averageStudentUseCase.call();

      averageStudentList.assignAll(result);
    } catch (e) {
      print('فشل في تحميل المعدل');
     // Get.snackbar('خطأ', 'فشل في تحميل المعدلات: $e');
    } finally {
      isLoading.value = false;
    }
  }
}