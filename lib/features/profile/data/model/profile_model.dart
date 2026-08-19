import '../../domain/entity/prodile_entity.dart';

class ProfileModel extends ProfileEntity {

  ProfileModel({
    required super.id,
    required super.full_name,
    required super.email,
    required super.phone,
    required super.location,
    required super.profile_image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {

    var profile = json['profile'];
    if(profile['original'] != null) {
      profile = profile['original']['user'];
    }

    return ProfileModel(
      id: profile['id'].toString(),
      full_name: profile['full_name'],
      email: profile['email'],
      phone: profile['phone'],
      location: profile['location'],
      profile_image: profile['profile_image'] ?? '',
    );
  }
}