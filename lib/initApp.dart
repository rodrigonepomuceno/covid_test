import 'package:covid19/app/shared/services/local_storage_bindings.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/lang/translation_services.dart';
import 'package:covid19/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.home,
      defaultTransition: Transition.fade,
      initialBinding: LocalStorageBindings(),
      getPages: AppPages.getPagesList,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: AppColors.appBlue),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: AppColors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
