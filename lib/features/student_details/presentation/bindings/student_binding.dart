import 'package:get/get.dart';
import 'package:student_project1/features/student_details/data/datasources/update_mark_data_source.dart';
import 'package:student_project1/features/student_details/data/repositories/update_mark_repository_impl.dart';
import 'package:student_project1/features/student_details/domain/usecases/update_mark_usecase.dart';
import 'package:student_project1/features/student_details/presentation/controllers/update_mark_controller.dart';

import '../../data/datasources/student_remote_data_source.dart';
import '../../data/repositories/student_repository_impl.dart';
import '../../domain/usecases/profile_usecases.dart';
import '../controllers/student_controller.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    final dataSource = StudentRemoteDataSource();
    final updatesourceDataSource = UpdateMarkRemoteDataSource();

    // Repository
    final repository = StudentRepositoryImpl(dataSource);
    final updatesource = UpdateMarkRepositoryImpl(updatesourceDataSource);

    // UseCase
    final useCase = StudentUseCase(repository);
    final updatesouceUseCase = CreateMarkUseCase(updatesource);

    // Controller
    Get.lazyPut<StudentController>(
          () => StudentController(useCase),
    );
    Get.lazyPut<UpdateMarkController>(()=>UpdateMarkController(updateMarkUseCase: updatesouceUseCase));
  }

}