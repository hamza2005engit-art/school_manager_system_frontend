// class ProfileEntity {
//   String name;
//   String grade;
//   String section;
//   String id_student;
//   String school;
//   String age;
//   String location;
//
//   ProfileEntity({
//     required this.name,
//     required this.grade,
//     required this.section,
//     required this.school,
//     required this.age,
//     required this.location,
//     required this.id_student,
//   });
// }

//
class ProfileEntity {
  String id;
  String full_name;
  String email;
  String phone;
  String location;
  String profile_image;

  ProfileEntity({
    required this.id,
    required this.full_name,
    required this.email,
    required this.phone,
    required this.location,
    required this.profile_image
  });
}
