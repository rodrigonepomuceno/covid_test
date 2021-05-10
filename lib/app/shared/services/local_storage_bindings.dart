import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:get/get.dart';

class LocalStorageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageController>(() => LocalStorageController());
  }
}
