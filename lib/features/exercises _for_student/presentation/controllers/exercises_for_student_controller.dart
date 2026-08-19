import 'package:get/get.dart';

import '../../domain/entity/exercies_for_student_entity.dart';
import '../../domain/usecases/exercies_for_student_use_case.dart';

class ExercisesForStudentController extends GetxController {

  final ExerciesForStudentUseCase exerciesForStudentUseCase;

  ExercisesForStudentController(this.exerciesForStudentUseCase);
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  var exercises = Rxn<ExerciesForStudentEntity>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      final result = await exerciesForStudentUseCase();
      exercises.value = result;
    }
    catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}