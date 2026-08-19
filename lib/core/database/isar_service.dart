// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
//
// import '../../features/schedule/data/local/schedule_local.dart';
//
// class IsarService {
//   static late final Isar isar;
//
//   static Future<void> init() async {
//     final dir = await getApplicationDocumentsDirectory();
//
//     isar = await Isar.open(
//         [
//           ScheduleLocalSchema
//         ],
//         directory: dir.path
//     );
//   }
// }