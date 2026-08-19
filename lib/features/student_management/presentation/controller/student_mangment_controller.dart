import 'package:get/get.dart';
import 'package:student_project1/features/student_management/domain/usecase/student_managment_usercase.dart';

import '../../domain/entity/student_managment_entity.dart';

class StudentMangmentController extends GetxController {

  final StudentManagmentUseCase studentManagmentUseCase;
  StudentMangmentController(this.studentManagmentUseCase);

  Rx isLoading = false.obs;
  final RxList<StudentManagmentEntity> students = <StudentManagmentEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    getStudents();
    print('students controller');
  }

  Future<void> getStudents() async{
    try {
      isLoading.value = true;
      students.value = await studentManagmentUseCase();
      print('students ${students}');
    } catch(e) {
      print('error ${e}');
    }finally {
      isLoading.value = false;
    }
  }

}