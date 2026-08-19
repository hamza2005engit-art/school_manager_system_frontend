import 'package:student_project1/features/home/domain/entities/next_class.dart';
import 'package:student_project1/features/home/domain/repositories/next_class_repository.dart';

class NextClassUseCase {
  final NextClassRepository repository;

  NextClassUseCase(this.repository);

  Future<NextClass> call() {
    return repository.nextClass();
  }
}
