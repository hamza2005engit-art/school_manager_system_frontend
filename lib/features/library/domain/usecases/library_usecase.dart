import 'package:student_project1/features/library/domain/entity/entity_library.dart';
import 'package:student_project1/features/library/domain/repository/library_repository.dart';

class LibraryUseCase {

  final LibraryRepository libraryRepository;

  LibraryUseCase(this.libraryRepository);

  Future<List<LibraryEntity>> call() {
    return libraryRepository.getBook();
  }
}