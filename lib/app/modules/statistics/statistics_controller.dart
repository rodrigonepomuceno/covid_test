import 'package:covid19/app/shared/models/contry_models.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  List<CountryModel> countryList = Get.arguments ?? [];
}
