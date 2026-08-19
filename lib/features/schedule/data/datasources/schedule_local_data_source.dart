// import 'package:isar/isar.dart';
// import 'package:student_project1/core/database/isar_service.dart';
// import 'package:student_project1/features/schedule/data/local/schedule_local.dart';
// import 'package:student_project1/features/schedule/data/model/schedule_model.dart';

// class ScheduleLocalDataSource  {
//   final Isar _isar = IsarService.isar;

//   /// حفظ الجدول كاملاً
//   Future<void> saveSchedule(List<ScheduleModel> schedules) async {
//     await _isar.writeTxn(() async {
//       await _isar.scheduleLocals.clear();

//       final localSchedule = schedules.map((e) {
//         final item = ScheduleLocal();

//         item.scheduleId = e.id;
//         item.period = e.period as int;
//         item.startTime = e.start_time;
//         item.endTime = e.end_time;
//         item.material = e.material;
//         item.teacher = e.teacher;
//         item.section = e.section;
//         item.studyStage = e.studyStage;

//         return item;

//       }).toList();

//       await _isar.scheduleLocals.putAll(localSchedule);
//     });
//   }

//   /// قراءة الجدول من Isar
//   Future<List<ScheduleLocal>> getSchedule() async {
//     return await _isar.scheduleLocals.where().findAll();
//   }

//   /// حذف جميع البيانات
//   Future<void> deleteSchedule() async {
//     await _isar.writeTxn(()async {
//       await _isar.scheduleLocals.clear();
//     });
//   }


// }