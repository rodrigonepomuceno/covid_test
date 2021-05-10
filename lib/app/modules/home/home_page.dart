import 'package:covid19/app/modules/home/home_controller.dart';
import 'package:covid19/app/modules/home/home_routes.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: HomeRoutes.myCountry,
        onGenerateRoute: HomeRoutes.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.appBlue,
          unselectedItemColor: AppColors.black50,
          currentIndex: controller.pageIndex.value,
          onTap: controller.setCurrentPage,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.my_location,
                size: 45,
                color: AppColors.appBlue,
              ),
              icon: Icon(Icons.my_location),
              label: 'other_countries'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person_pin_circle_outlined,
                size: 45,
                color: AppColors.appBlue,
              ),
              icon: Icon(
                Icons.person_pin_circle_outlined,
              ),
              label: 'my_country'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                size: 45,
                color: AppColors.appBlue,
              ),
              icon: Icon(Icons.person),
              label: 'profile'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.new_releases_outlined,
                size: 45,
                color: AppColors.appBlue,
              ),
              icon: Icon(Icons.new_releases_outlined),
              label: 'news'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
