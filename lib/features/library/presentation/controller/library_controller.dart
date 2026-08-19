import 'package:get/get.dart';
import 'package:student_project1/features/library/domain/entity/entity_library.dart';
import 'package:student_project1/features/library/domain/usecases/library_usecase.dart';

class LibraryController extends GetxController {

  final LibraryUseCase libraryUseCase;
  LibraryController(this.libraryUseCase);

  @override
  void onInit() {
    getBook();
    super.onInit();
  }
  var books = <LibraryEntity>[].obs;
  var schoolBooks = <LibraryEntity>[].obs;
  var libraryBooks = <LibraryEntity>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getBook() async {
    try {
      print("START REQUEST");
      isLoading.value = true;
      errorMessage.value = '';

      final result = await libraryUseCase();
      print("RESULT RECEIVED");

      books.assignAll(result);

      if (result.isNotEmpty) {
        schoolBooks.assignAll(
            result.where((book) => book.typeBook.toLowerCase() == 'school').toList()
        );

        libraryBooks.assignAll(
            result.where((book) => book.typeBook.toLowerCase() == 'enrichment').toList()
        );

        print("School Books Count: ${schoolBooks.length}");
        print("Library Books Count: ${libraryBooks.length}");
      } else {
        schoolBooks.clear();
        libraryBooks.clear();
      }

    } catch (e) {
      print("ERROR: $e");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
      print("LOADING FINISHED");
    }
  }
}