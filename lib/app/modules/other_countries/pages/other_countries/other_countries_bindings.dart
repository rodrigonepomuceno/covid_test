import 'package:covid19/app/modules/my_country/my_country_controller.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_controller.dart';
import 'package:covid19/app/shared/repositories/my_country/my_country_repository.dart';
import 'package:covid19/app/shared/repositories/other_countries/other_countries_repository.dart';
import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:get/get.dart';

class OtherCountriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherCountriesRepository());
    Get.lazyPut(() => LocalStorageController());
    Get.lazyPut(() => MyCountryRepository());
    Get.lazyPut(() => MyCountryController(
        localStorageController: Get.find(), repository: Get.find()));

    Get.lazyPut<OtherCountriesController>(() => OtherCountriesController(
        repository: Get.find(),
        localStorageController: Get.find(),
        myCountryController: Get.find()));
  }
}
