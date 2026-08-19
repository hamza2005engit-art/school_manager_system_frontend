import 'package:get/get.dart';

import '../../domain/entity/student_entity.dart';
import '../../domain/usecases/profile_usecases.dart';

class StudentController extends GetxController {
  final StudentUseCase studentUseCase;

  StudentController(this.studentUseCase);

  @override
  void onInit() {
    getStudentDetails();
    super.onInit();
  }

  var studentDetails = Rxn<StudentEntity>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getStudentDetails() async {
    try {
      isLoading.value = true;
      final result = await studentUseCase();
      studentDetails.value = result;
    }
    catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}