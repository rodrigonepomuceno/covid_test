import 'package:covid19/app/modules/profile/profile_controller.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/widgets/app_list_tile.dart';
import 'package:covid19/app/shared/widgets/app_sized_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: [
                AppListTile(
                  onTap: controller.goToDefaultMyCountryPage,
                  leading: Icon(
                    Icons.map,
                    color: AppColors.appBlue,
                  ),
                  body: Text(
                    'my_country'.tr,
                    style: TextStyle(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppListTile(
                  onTap: controller.setShowMenu,
                  leading: Icon(
                    Icons.language,
                    color: AppColors.appBlue,
                  ),
                  body: Text(
                    'language'.tr,
                    style: TextStyle(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                controller.showMenu.value
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            AppListTile(
                              onTap: controller.setEn,
                              leading: Row(
                                children: [
                                  Text(
                                    'english'.tr,
                                    style: TextStyle(
                                      color: !controller.isPt
                                          ? AppColors.appBlue
                                          : AppColors.black,
                                    ),
                                  ),
                                  AppSizedWidth(value: 5),
                                  !controller.isPt
                                      ? Icon(
                                          Icons.check,
                                          size: 18,
                                          color: AppColors.appBlue,
                                        )
                                      : Container(),
                                ],
                              ),
                              hasBotDivider: true,
                            ),
                            AppListTile(
                              onTap: controller.setPt,
                              leading: Row(
                                children: [
                                  Text(
                                    'portuguese'.tr,
                                    style: TextStyle(
                                      color: controller.isPt
                                          ? AppColors.appBlue
                                          : AppColors.black,
                                    ),
                                  ),
                                  AppSizedWidth(value: 5),
                                  controller.isPt
                                      ? Icon(
                                          Icons.check,
                                          size: 18,
                                          color: AppColors.appBlue,
                                        )
                                      : Container(),
                                ],
                              ),
                              hasBotDivider: true,
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
