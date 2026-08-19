import 'package:student_project1/features/student_details/domain/entity/update_mark_entity.dart';
import 'package:student_project1/features/student_details/domain/repository/update_mark_repository.dart';

class CreateMarkUseCase {

  final CreateMarkRepository updateMarkRepository;
  CreateMarkUseCase(this.updateMarkRepository);

  Future<bool> call(CreateMarkEntity updateMarkEntity) {
    return updateMarkRepository.updateMark(updateMarkEntity);
  }
}