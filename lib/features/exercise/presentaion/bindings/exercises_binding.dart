import 'package:get/get.dart';
import 'package:student_project1/features/exercise/data/datasources/get_grade_remote_data.dart';
import 'package:student_project1/features/exercise/data/repositories/get_grade_repository_impl.dart';
import 'package:student_project1/features/exercise/domain/repository/get_grade_repository.dart';
import 'package:student_project1/features/exercise/domain/usecases/delete_exercise.dart';
import 'package:student_project1/features/exercise/domain/usecases/get_exercises_usecase.dart';
import 'package:student_project1/features/exercise/domain/usecases/get_grade_usecase.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/exercises_controller.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/get_grade_controller.dart';

import '../../data/datasources/exercises_remote_data.dart';
import '../../data/repositories/exercises_repository_impl.dart';
import '../../domain/usecases/exercises_usecase.dart';
import '../../domain/usecases/get_exercise_for_student.dart';

class ExercisesBindings extends Bindings {
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
    Get.lazyPut<GradeController>(()=>GradeController(gradeUsecase));
    Get.lazyPut<ExercisesController>(
          () => ExercisesController(useCase,getExersices,deleteExercise,getExerciseForStudent),
    );
  }

}