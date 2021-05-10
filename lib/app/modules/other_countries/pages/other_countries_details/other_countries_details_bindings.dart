import 'package:covid19/app/modules/other_countries/pages/other_countries_details/other_countries_details_controller.dart';
import 'package:covid19/app/shared/repositories/my_country/my_country_repository.dart';
import 'package:get/get.dart';

class OtherCountriesDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCountryRepository());
    Get.lazyPut<OtherCountriesDetailsController>(
        () => OtherCountriesDetailsController(repository: Get.find()));
  }
}
