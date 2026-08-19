import 'package:get/get.dart';
import 'package:student_project1/features/exercise/data/model/get_grade_model.dart';
import 'package:student_project1/features/exercise/domain/entity/get_grade_entity.dart';
import 'package:student_project1/features/exercise/domain/repository/get_grade_repository.dart';
import 'package:student_project1/features/exercise/domain/usecases/get_grade_usecase.dart';

class GradeController extends GetxController {

  final GradeUseCase gradeUseCase;

  GradeController(this.gradeUseCase);

  var isLoading = false.obs;

  var grades = <GradeEntity>[].obs;
  @override
  void onInit() {
    super.onInit();
    get_grade();
  }

  Future<void> get_grade() async{
    try {
      isLoading.value = true;

      final result = await gradeUseCase();

      grades.value = result;
      print(result);

    } catch(e) {
      print('Error controller ${e}');
    } finally {
      isLoading.value = false;
    }
  }

}