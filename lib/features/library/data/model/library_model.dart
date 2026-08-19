import 'package:student_project1/features/library/domain/entity/entity_library.dart';

class LibraryModel extends LibraryEntity {

  LibraryModel({
    required super.imageBook,
    required super.linkBook,
    required super.titleBook,
    required super.typeBook,
  });

  factory LibraryModel.fromJson(Map<String,dynamic> json) {
    final book = json['material'];
    return LibraryModel(
        imageBook: json['cover_image_url'],
        linkBook: json['book_url'],
        titleBook: json['title'],
        typeBook: json['type']
    );
  }

}
