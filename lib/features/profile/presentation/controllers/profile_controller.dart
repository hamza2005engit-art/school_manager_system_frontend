import 'package:get/get.dart';

import '../../domain/entity/prodile_entity.dart';
import '../../domain/usecases/profile_usecase.dart';

class ProfileController extends GetxController {

  final ProfileUseCase profileUseCase;

  ProfileController(this.profileUseCase);
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  var profile = Rxn<ProfileEntity>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> getProfile() async {

    try {

      print("START REQUEST");

      isLoading.value = true;

      final result = await profileUseCase();

      print("RESULT RECEIVED");

      print(result);

      profile.value = result;

      print("PROFILE VALUE:");
      print(profile.value);

    } catch (e) {

      print("ERROR:");
      print(e);

      errorMessage.value = e.toString();

    } finally {

      isLoading.value = false;

      print("LOADING FINISHED");
    }
  }
}