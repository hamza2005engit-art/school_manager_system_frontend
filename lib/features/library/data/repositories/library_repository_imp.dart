import 'package:student_project1/features/library/data/datasources/library_remote_data.dart';
import 'package:student_project1/features/library/domain/entity/entity_library.dart';
import 'package:student_project1/features/library/domain/repository/library_repository.dart';

class LibraryRepositoryImp extends LibraryRepository {
  final LibraryRemoteDataSource libraryRemoteDataSource;
  LibraryRepositoryImp(this.libraryRemoteDataSource);

  @override
  Future<List<LibraryEntity>> getBook() {
   return libraryRemoteDataSource.getLibrary();
  }

}