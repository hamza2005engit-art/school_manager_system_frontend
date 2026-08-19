import 'package:get/get.dart';
import '../../data/datasource/student_managment_datasource.dart';
import '../../data/repositories/student_mangment_repository_impl.dart';
import '../../domain/usecase/student_managment_usercase.dart';
import '../controller/student_mangment_controller.dart';

class StudentMangmentBinding extends Bindings {
  @override
  void dependencies() {
    final datasource = StudentManagmentRemoteDataSource();

    final repository = StudentMangmentRepositoryImpl(datasource);

    final usecase = StudentManagmentUseCase(repository);

    Get.lazyPut<StudentMangmentController>(
            ()=> StudentMangmentController(usecase));
  }

}