import 'package:get/get.dart';
import 'package:student_project1/features/student_managment_admin/data/datasources/student_managment_admin_data_source.dart';
import 'package:student_project1/features/student_managment_admin/data/repositories/student_managment_admin_repository_impl.dart';
import 'package:student_project1/features/student_managment_admin/domain/repository/student_managment_admin_repository.dart';
import 'package:student_project1/features/student_managment_admin/domain/usecases/student_managment_admin_usecase.dart';
import 'package:student_project1/features/student_managment_admin/presentation/controller/get_grade_controller.dart';
import 'package:student_project1/features/student_managment_admin/presentation/controller/student_managment_admin_controller.dart';

import '../../domain/usecases/take_attendance_usecase.dart';

class StudentManagmentAdminBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<StudentManagmentAdminRemoteDataSource>(
          () => StudentManagmentAdminRemoteDataSource(),
    );

    Get.lazyPut<StudentManagmentAdminRepository>(
          () => StudentManagmentAdminRepositoryImpl(
        Get.find<StudentManagmentAdminRemoteDataSource>(),
      ),
    );

    Get.lazyPut<StudentManagmentAdminUseCase>(
          () => StudentManagmentAdminUseCase(
        Get.find<StudentManagmentAdminRepository>(),
      ),
    );

    Get.lazyPut<TakeAttendanceUseCase>(()=>TakeAttendanceUseCase(
      Get.find<StudentManagmentAdminRepository>()
    ));

    Get.lazyPut<StudentManagmentAdminController>(
          () => StudentManagmentAdminController(
        Get.find<StudentManagmentAdminUseCase>(),Get.find<TakeAttendanceUseCase>()
      ),
    );

    Get.lazyPut<GetGradeController>(() => GetGradeController());
  }
}