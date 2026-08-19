import '../entity/update_mark_entity.dart';

abstract class CreateMarkRepository {

  Future<bool> updateMark(CreateMarkEntity markEntity);
}