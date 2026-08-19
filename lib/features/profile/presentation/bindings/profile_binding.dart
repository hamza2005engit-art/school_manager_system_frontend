import 'package:get/get.dart';
import 'package:student_project1/features/auth/presentation/controllers/logout_constroller.dart';

import '../../data/datasources/profile_remote_data.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../controllers/profile_controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    final dataSource = ProfileRemoteDataSource();

    // Repository
    final repository = ProfileRepositoryImpl(dataSource);

    // UseCase
    final useCase = ProfileUseCase(repository);

    // Controller
    Get.lazyPut(() => LogoutController());
    Get.lazyPut<ProfileController>(
          () => ProfileController(useCase),
    );
  }

}