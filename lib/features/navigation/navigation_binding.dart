import 'package:get/get.dart';
import 'package:student_project1/features/navigation/navigation_controller.dart';

class NavigationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>NavigationController());
    // items controller 
    //Get.lazyPut(()=>);
    // TODO: items controller
  }

}
