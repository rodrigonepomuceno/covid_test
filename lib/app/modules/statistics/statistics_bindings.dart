import 'package:covid19/app/modules/statistics/statistics_controller.dart';
import 'package:get/get.dart';

class StatisticsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}
