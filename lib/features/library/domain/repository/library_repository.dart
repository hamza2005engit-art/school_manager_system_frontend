import 'package:student_project1/features/library/domain/entity/entity_library.dart';

abstract class LibraryRepository {

  Future<List<LibraryEntity>> getBook();
}