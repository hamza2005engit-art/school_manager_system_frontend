import 'package:get/get.dart';
import 'package:student_project1/features/home_page/data/datasources/statistics_datasource.dart';
import 'package:student_project1/features/home_page/data/repositories/statistics_repository_impl.dart';

import '../../data/datasources/attendance_datasource.dart';
import '../../data/datasources/average_student_datasource.dart';
import '../../data/repositories/attendance_repository_impl.dart';
import '../../data/repositories/average_student_repository_impl.dart';
import '../../domain/usecases/attendance_usecase.dart';
import '../../domain/usecases/average_student_usecase.dart';
import '../../domain/usecases/get_students_count_usecase.dart';
import '../../domain/usecases/get_teacher_count_usecase.dart';
import '../controllers/attendance_controller.dart';
import '../controllers/average_controller.dart';
import '../controllers/statisctics_controller.dart';

class GetStatiscticsBinding extends Bindings {
  @override
  void dependencies() {

    final datasource = StatisticsRemoteDataSource();
    final datasourceAttendance = AttendanceRemoteDataSource();
    final datasouceAverage = AverageStudentDataSource();

    final statiscticsRepositoryImpl = StatiscticsRepositoryImpl(datasource);
    final repositoryAttendance = AttendanceRepositoryImpl(datasourceAttendance);
    final averageRepositoryImpl = AverageStudentRepositoryImpl(datasouceAverage);

    final getStudentsCountUseCase = GetStudentsCountUseCase(statiscticsRepositoryImpl);
    final usecaseAttendance = AttendanceUseCase(repositoryAttendance);
    final averageUseCase = AverageStudentUseCase(averageRepositoryImpl);

    final getTeacherCountUseCase = GetTeacherCountUseCase(statiscticsRepositoryImpl);

    Get.lazyPut<StatiscticsController>(
          () => StatiscticsController(getStudentsCountUseCase,getTeacherCountUseCase),
    );
    Get.lazyPut<AttendanceController>
      (()=>AttendanceController(usecaseAttendance));

    Get.lazyPut<AverageController>(
        () => AverageController(averageUseCase)
    );

  }


}