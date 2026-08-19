import 'package:get/get.dart';
import '../../data/model/schedule_model.dart';
import '../../domain/usecases/schedule_use_case.dart';

class ScheduleController extends GetxController {

  final ScheduleUseCase scheduleUseCase;
  ScheduleController(this.scheduleUseCase);

  RxList<ScheduleModel> schedule = <ScheduleModel>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getSchedule();
  }

  Future<void> getSchedule() async {
    try {
      isLoading.value = true;

      final result = await scheduleUseCase();

      schedule.value = result as List<ScheduleModel>;

    } catch (e) {
      errorMessage.value = e.toString();
      print('ERROR: $e');

    } finally {
      isLoading.value = false;
    }
  }
}