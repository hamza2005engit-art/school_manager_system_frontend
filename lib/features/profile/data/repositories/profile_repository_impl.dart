
import '../../domain/entity/prodile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasources/profile_remote_data.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<ProfileEntity> getProfile() {

    return profileRemoteDataSource.getProfile();
  }

}