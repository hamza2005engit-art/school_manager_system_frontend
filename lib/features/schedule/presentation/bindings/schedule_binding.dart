import 'package:get/get.dart';

import '../../data/datasources/schedule_remote_data_source.dart';
import '../../data/repositories/schedule_repository_impl.dart';
import '../../domain/usecases/schedule_use_case.dart';
import '../controllers/schedule_controller.dart';


class ScheduleBinding extends Bindings {
  @override
  void dependencies() {

    // DataSource
    final dataSource = ScheduleRemoteDataSource();

    // Repository
    final repository = ScheduleRepositoryImpl(dataSource);

    // UseCase
    final useCase = ScheduleUseCase(repository);

    // Controller
    Get.lazyPut<ScheduleController>(
          () => ScheduleController(useCase),
    );
  }
}