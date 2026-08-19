import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/features/exercise/domain/usecases/delete_exercise.dart';
import 'package:student_project1/features/exercise/domain/usecases/get_exercises_usecase.dart';
import '../../domain/entity/exercises_entity.dart';
import '../../domain/usecases/exercises_usecase.dart';
import '../../domain/usecases/get_exercise_for_student.dart';

class ExercisesController extends GetxController {
  final ExercisesUseCase exercisesUseCase;
  final GetExercisesUseCase getExercisesUseCase;
  final DeleteExerciseUseCase deleteExerciseUseCase;
  final GetExerciseForStudentUseCase getExerciseForStudentUseCase;

  ExercisesController(
    this.exercisesUseCase,
    this.getExercisesUseCase,
    this.deleteExerciseUseCase,
    this.getExerciseForStudentUseCase,
  );

  var exercises = <ExercisesEntity>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var exercisesForStudent = <ExercisesEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    final role = (GetStorage().read('role') ?? '').toString();

    if (role == 'teacher') {
      getExercises();
    } else if (role == 'student') {
      getExercisesForStudent();
    } else {
      getExercises();
    }
  }

  Future<void> getExercises() async {
    try {
      print('controller');
      errorMessage.value = '';
      isLoading.value = true;

      exercises.value = await getExercisesUseCase();
      print('exersice ${exercises.value}');
    } catch (e) {
      print('ERROR: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getExercisesForStudent() async {
    try {
      print('controller');
      errorMessage.value = '';
      isLoading.value = true;

      exercisesForStudent.value = await getExerciseForStudentUseCase();      print('exersice ${exercises.value}');
    } catch (e) {
      print('ERROR: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createExercise({
    required String title,
    required String content,
    required String date,
    required int studyStageId,
  }) async {
    try {
      print('controller');
      isLoading.value = true;

      final entity = ExercisesEntity(
        title: title,
        content: content,
        date: date,
        studyStageId: studyStageId,
      );
      print('entity ${entity.content}');

      await exercisesUseCase.call(entity);

      Get.snackbar("Success", "Exercise created");

      await getExercises();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteExercise(int id) async {
    try {
      print('delete controller');
      isLoading.value = true;

      await deleteExerciseUseCase.call(id);

      Get.snackbar("Success", "Exercise Delete");

      await getExercises();
      await getExercisesForStudent();
      // exercisesForStudent.refresh();
      exercises.refresh();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
