//
// import 'package:student_project1/features/home/data/models/exercises_model.dart';
// import 'package:student_project1/features/home/data/models/fees_model.dart';
// import 'package:student_project1/features/home/data/models/marks_student_model.dart';
// import 'package:student_project1/features/home/data/models/notifincatoin_model.dart';
//
// import '../models/addnotifincation_model.dart';
// import 'home_remote_data_source.dart';
//
// class HomeRemoteDataSourceMock implements HomeRemoteDataSource {
//
//   @override
//
//   Future<NotifincationModel> notifincation(
//       DateTime date,
//       String content,
//       String title,
//
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return NotifincationModel(
//       date: date,
//       content:content,
//       title:title,
//
//       token: "mock_token",
//     );
//   }
//
//   @override
//
//   Future<AddNotifincationModel> addnotifincation(
//       String grade,
//       String content,
//       String title,
//
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return AddNotifincationModel(
//       grade: grade,
//       content:content,
//       title:title,
//
//       token: "mock_token",
//     );
//   }
//
//   Future<MarksStudentModel> marksstudent(
//       String subject,
//       String total_academi,
//       String degree,
//       String class_rank,
//       int exersices,
//       int test,
//       int finale,
//       int total,
//
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return MarksStudentModel(
//
//        subject:subject,
//        total_academi:total_academi,
//        degree:degree,
//        class_rank:class_rank,
//        exersices:exersices,
//        test:test,
//        finale:finale,
//        total:total,
//
//       token: "mock_token",
//     );
//   }
//
//
//   Future<ExercisesModel> exercises(
//       DateTime date,
//       String content,
//       String title,
//       String grade,
//
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return ExercisesModel(
//       date: date,
//       content:content,
//       title:title,
//       grade:grade,
//
//       token: "mock_token",
//     );
//   }
//
//   Future<FeesModel> feesuser(
//       int toata_fees,
//       int total,
//       int paid,
//       int toata_remaining,
//
//       ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return FeesModel(
//       toata_fees: toata_fees,
//       total:total,
//       paid:paid,
//       toata_remaining:toata_remaining,
//
//       token: "mock_token",
//     );
//   }
//
//   @override
//   Future<List<NotifincationModel>> getNotifications() {
//     // TODO: implement getNotifications
//     throw UnimplementedError();
//   }
// }
