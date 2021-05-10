import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'en_us.dart';
import 'pt_br.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale;
  LocalStorageController localStorageController;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'pt_BR': pt_BR,
      };
}
