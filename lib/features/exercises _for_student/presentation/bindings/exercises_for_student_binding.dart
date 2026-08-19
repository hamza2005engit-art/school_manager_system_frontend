import 'package:get/get.dart';
import '../../../exercise/data/datasources/exercises_remote_data.dart';
import '../../../exercise/data/datasources/get_grade_remote_data.dart';
import '../../../exercise/data/repositories/exercises_repository_impl.dart';
import '../../../exercise/data/repositories/get_grade_repository_impl.dart';
import '../../../exercise/domain/usecases/delete_exercise.dart';
import '../../../exercise/domain/usecases/exercises_usecase.dart';
import '../../../exercise/domain/usecases/get_exercise_for_student.dart';
import '../../../exercise/domain/usecases/get_exercises_usecase.dart';
import '../../../exercise/domain/usecases/get_grade_usecase.dart';
import '../../../exercise/presentaion/controllers/exercises_controller.dart';
import '../../data/datasources/exercises_for_student_remote_data.dart';
import '../../data/repositories/exercises_for_student_repository_impl.dart';
import '../../domain/usecases/exercies_for_student_use_case.dart';
import '../controllers/exercises_for_student_controller.dart';

class ExercisesForStudentBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    final dataSource = ExercisesRemoteDataSource();
    final gradedataSource = GradeRemoteDataSource();

    // Repository
    final repository = ExercisesRepositoryImpl(dataSource);
    final gradeRepository = GradeRepositoryImpl(gradedataSource);

    // UseCase
    final useCase = ExercisesUseCase(repository);
    final gradeUsecase = GradeUseCase(gradeRepository);
    final getExersices = GetExercisesUseCase(repository);
    final deleteExercise = DeleteExerciseUseCase(repository);
    final getExerciseForStudent = GetExerciseForStudentUseCase(repository);

    // Controller
    Get.lazyPut<ExercisesController>(
          () => ExercisesController(useCase,getExersices,deleteExercise,getExerciseForStudent),
    );
  }

}