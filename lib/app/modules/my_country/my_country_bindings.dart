import 'package:covid19/app/modules/my_country/my_country_controller.dart';
import 'package:covid19/app/shared/repositories/my_country/my_country_repository.dart';
import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:get/get.dart';

class MyCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCountryRepository());
    Get.lazyPut(() => LocalStorageController());
    Get.lazyPut<MyCountryController>(() => MyCountryController(
        repository: Get.find(), localStorageController: Get.find()));
  }
}
