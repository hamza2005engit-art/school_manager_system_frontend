
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:student_project1/features/library/data/datasources/library_remote_data.dart';
import 'package:student_project1/features/library/data/repositories/library_repository_imp.dart';
import 'package:student_project1/features/library/domain/usecases/library_usecase.dart';
import 'package:student_project1/features/library/presentation/controller/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    final dataSource = LibraryRemoteDataSource();

    // Repository
    final repository = LibraryRepositoryImp(dataSource);

    // UseCase
    final useCase = LibraryUseCase(repository);

    // Controller
    Get.lazyPut<LibraryController>(
          () => LibraryController(useCase),
    );
  }

}