import 'package:student_project1/features/home/domain/entities/next_class.dart';

abstract class NextClassRepository {
  Future<NextClass> nextClass();
}
