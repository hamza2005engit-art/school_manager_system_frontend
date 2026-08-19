
import '../entity/prodile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
}