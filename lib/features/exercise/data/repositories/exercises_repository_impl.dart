import '../../domain/entity/exercises_entity.dart';
import '../../domain/repository/exercises_repository.dart';
import '../datasources/exercises_remote_data.dart';

class ExercisesRepositoryImpl implements ExerciseRepository {

  final ExercisesRemoteDataSource remoteDataSource;

  ExercisesRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> createExercise(ExercisesEntity entity) {
    return remoteDataSource.createExercise(
      title: entity.title,
      content: entity.content,
      date: entity.date,
      studyStageId: entity.studyStageId!,
    );
  }

  @override
  Future<List<ExercisesEntity>> getExercises() {
    return remoteDataSource.getExercises();
  }

  Future<void> deleteExercise(int id) {
    return remoteDataSource.deleteExercise(id);
  }

  @override
  Future<List<ExercisesEntity>> getExercisesForStudent() {
    return remoteDataSource.getExercisesForStudent();
  }
}