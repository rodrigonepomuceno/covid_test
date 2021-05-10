import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  final box = GetStorage();
  String get dafaultCountry => box.read('dafaultCountry') ?? 'brazil';
  String get languageCode => box.read('languageCode') ?? 'pt';
  String get countryCode => box.read('countryCode') ?? 'BR';

  defaultInit() {
    box.write('dafaultCountry', dafaultCountry);
    box.write('languageCode', languageCode);
    box.write('countryCode', countryCode);

    Get.updateLocale(Locale(languageCode, countryCode));
  }

  setLang(String languageCode, String countryCode) {
    box.write('languageCode', languageCode);
    box.write('countryCode', countryCode);

    Get.updateLocale(Locale(languageCode, countryCode));
  }

  setDefaultCountry(String dafaultCountry) {
    box.write('dafaultCountry', dafaultCountry);

    Get.updateLocale(Locale(languageCode, countryCode));
  }
}
