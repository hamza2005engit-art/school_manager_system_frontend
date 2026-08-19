
import '../../domain/entity/student_entity.dart';
import '../../domain/repository/student_repository.dart';
import '../datasources/student_remote_data_source.dart';

class StudentRepositoryImpl extends StudentRepository {

  final StudentRemoteDataSource studentRemoteDataSource;
  StudentRepositoryImpl(this.studentRemoteDataSource);

  @override
  Future<StudentEntity> getStudentDetails() {
    return studentRemoteDataSource.getStudentDetails();
  }

}