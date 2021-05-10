import 'package:covid19/app/modules/profile/profile_controller.dart';
import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:get/get.dart';

class ProfilesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageController());
    Get.lazyPut<ProfileController>(
        () => ProfileController(localStorageController: Get.find()));
  }
}
