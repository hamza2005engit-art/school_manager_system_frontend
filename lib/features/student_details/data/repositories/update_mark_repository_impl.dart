import 'package:student_project1/features/student_details/data/datasources/update_mark_data_source.dart';
import 'package:student_project1/features/student_details/domain/entity/update_mark_entity.dart';
import 'package:student_project1/features/student_details/domain/repository/update_mark_repository.dart';

import '../model/update_mark_model.dart';

class UpdateMarkRepositoryImpl extends CreateMarkRepository {

  final UpdateMarkRemoteDataSource updateMarkRemoteDataSource;
  UpdateMarkRepositoryImpl(this.updateMarkRemoteDataSource);

  @override
  Future<bool> updateMark(CreateMarkEntity markEntity) {
    final markModel = UpdateMarkModel(
      studentId: markEntity.studentId,
      materialId: markEntity.materialId,
      type: markEntity.type,
      score: markEntity.score,
    );
    return updateMarkRemoteDataSource.updateMark(markModel);
  }

}