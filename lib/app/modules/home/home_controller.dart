import 'package:covid19/app/modules/home/home_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 1.obs;

  setCurrentPage(int index) {
    if (index != pageIndex.value) {
      pageIndex.value = index;
      Get.toNamed(HomeRoutes.getRoutesNames[index], id: 1);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
