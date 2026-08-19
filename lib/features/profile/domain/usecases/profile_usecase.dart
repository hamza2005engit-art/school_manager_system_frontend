
import '../entity/prodile_entity.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository profileRepository;

  ProfileUseCase(this.profileRepository);

 Future<ProfileEntity> call() {
   return profileRepository.getProfile();
 }

}