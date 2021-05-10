import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:covid19/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LocalStorageController localStorageController;
  RxList<String> listPicker = <String>[].obs;
  var showMenu = false.obs;
  ProfileController({@required this.localStorageController});

  addList() {
    listPicker.clear();
    listPicker.add('english'.tr);
    listPicker.add('portuguese'.tr);
  }

  bool get isPt => localStorageController.languageCode == 'pt';
  setShowMenu() {
    showMenu.value = !showMenu.value;
  }

  setEn() {
    localStorageController.setLang('en', 'US');
    setShowMenu();
  }

  setPt() {
    localStorageController.setLang('pt', 'BR');
    setShowMenu();
  }

  goToDefaultMyCountryPage() {
    Get.toNamed(AppPages.defaultMyCountry, arguments: true);
  }
}
