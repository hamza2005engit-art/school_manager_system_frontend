import 'package:get/get.dart';
import 'package:student_project1/features/home/domain/usecases/exercises_usecase.dart';
import 'package:student_project1/features/home/domain/usecases/fees_usecase.dart';
import 'package:student_project1/features/home/domain/usecases/marks_student_usecase.dart';
import 'package:student_project1/features/home/domain/usecases/notification_usecase.dart';

import '../../data/datasources/home_remote_data_source.dart';
import '../../data/datasources/home_remote_data_source_moke.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/addnotifincation_usecase.dart';
import '../controllers/addnotifincation_controller.dart';
import '../controllers/exercises_controller.dart';
import '../controllers/fees_controller.dart';
import '../controllers/marks_student_controller.dart';
import '../controllers/navbar_controller.dart';
import '../controllers/notfincation_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => NotifincationUsecase(Get.find()));
    Get.lazyPut(() => NotfincationController(Get.find()));
    Get.lazyPut(() => AddNotifincationUsecase(Get.find()));
    Get.lazyPut(() => AddNotfincationController(Get.find()));
    Get.lazyPut(() => MarksStudentUsecase(Get.find()));
    Get.lazyPut(() => MarksStudentController(Get.find()));
    Get.lazyPut(() => ExercisesUsecase(Get.find()));
    Get.lazyPut(() => ExercisesController(Get.find()));
    Get.lazyPut(() => NavBarController());
    Get.lazyPut(() => FeesUsecase(Get.find()));
    Get.lazyPut(() => FeesController(Get.find()));
  }

}