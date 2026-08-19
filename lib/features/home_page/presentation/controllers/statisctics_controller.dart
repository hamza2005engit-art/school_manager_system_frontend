import 'package:get/get.dart';
import '../../domain/usecases/get_students_count_usecase.dart';
import '../../domain/usecases/get_teacher_count_usecase.dart';

class StatiscticsController extends GetxController {

  final GetStudentsCountUseCase getStudentsCountUseCase;
  final GetTeacherCountUseCase getTeachersCountUseCase;

  StatiscticsController(this.getStudentsCountUseCase, this.getTeachersCountUseCase);

  var isLoading = false.obs;
  var countStudents = 0.obs;
  var countTeachers = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCountStudent();
    getCountTeacher();
  }

  Future<void> getCountStudent() async {
    try {
      isLoading.value = true;

      final studentResult = await getStudentsCountUseCase.call();

      countStudents.value = studentResult.countStudent ?? 0;

    } catch (e) {
      Get.snackbar("خطأ", "فشل في تحميل البيانات: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCountTeacher() async {
    try {
      isLoading.value = true;

      final teacherCount = await getTeachersCountUseCase.call();
print('teacherCount------: ${teacherCount.countTeacher}');
      countTeachers.value = teacherCount.countTeacher ?? 0;

    } catch(e) {
      Get.snackbar("خطأ", "فشل في تحميل البيانات $e");
    }finally {
      isLoading.value = false;
    }
  }

}