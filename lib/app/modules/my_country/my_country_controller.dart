import 'dart:convert';

import 'package:covid19/app/shared/models/contry_models.dart';
import 'package:covid19/app/shared/models/country_details_model.dart';
import 'package:covid19/app/shared/repositories/my_country/my_country_repository.dart';
import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:covid19/routes/app_pages.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:share/share.dart';

class MyCountryController extends GetxController {
  final MyCountryRepository repository;
  final LocalStorageController localStorageController;
  final box = GetStorage();

  RxList<CountryModel> myCountryList = <CountryModel>[].obs;
  var differenceDeathsBetweenDays = ''.obs;
  var percentDeaths = 0.0.obs;
  var differenceConfirmedBetweenDays = ''.obs;
  var percentConfirmed = 0.0.obs;
  var differenceRecoveredBetweenDays = ''.obs;
  var percentRecovered = 0.0.obs;
  var differenceActiveBetweenDays = ''.obs;
  var percentActive = 0.0.obs;
  var riskOfContagion = ''.obs;
  var riskOfContagionColor = AppColors.appRed.obs;
  var pageState = Behaviour.regular.obs;
  var initIndex = 0.obs;
  var finalIndex = 1.obs;
  var myCountry = ''.obs;

  RxList<CountryDetailsModel> _countryDetailsList = <CountryDetailsModel>[].obs;

  MyCountryController(
      {@required this.repository, @required this.localStorageController});
  String countryFlag = '';

  @override
  void onInit() {
    getMyCountry();
    print('MyCountryController onInit');
    super.onInit();
  }

  getMyCountry() async {
    try {
      pageState.value = Behaviour.loading;
      await _initCountryDetailsModel();
      await localStorageController.defaultInit();
      myCountry.value = localStorageController.dafaultCountry;
      var response = await repository.getMyCountry(
        myCountry: myCountry.value,
      );
      myCountryList.clear();
      myCountryList.addAll(response);
      getAllDifferences();
      getAllPercents();
      pageState.value = Behaviour.regular;
    } catch (e) {
      print('Error ${e.toString()}');
      pageState.value = Behaviour.error;
    }
  }

  getAllDifferences() {
    getDifferenceDeathsBetweenDays(
        initDate: myCountryList[initIndex.value].deaths ?? 0,
        finalDate: myCountryList[finalIndex.value].deaths ?? 0);
    getDifferenceConfirmedBetweenDays(
        initDate: myCountryList[initIndex.value].confirmed ?? 0,
        finalDate: myCountryList[finalIndex.value].confirmed ?? 0);
    getDifferenceRecoveredBetweenDays(
        initDate: myCountryList[initIndex.value].recovered ?? 0,
        finalDate: myCountryList[finalIndex.value].recovered ?? 0);
    getDifferenceActiveBetweenDays(
        initDate: myCountryList[initIndex.value].active ?? 0,
        finalDate: myCountryList[finalIndex.value].active ?? 0);
  }

  getAllPercents() {
    getPercentDeathsBetweenDays(
        initDate: myCountryList[initIndex.value].deaths ?? 0,
        finalDate: myCountryList[finalIndex.value].deaths ?? 0);
    getPercentConfirmedBetweenDays(
        initDate: myCountryList[initIndex.value].confirmed ?? 0,
        finalDate: myCountryList[finalIndex.value].confirmed ?? 0);
    getPercentRecoveredBetweenDays(
        initDate: myCountryList[initIndex.value].recovered ?? 0,
        finalDate: myCountryList[finalIndex.value].recovered ?? 0);
    getPercentActiveBetweenDays(
        initDate: myCountryList[initIndex.value].active ?? 0,
        finalDate: myCountryList[finalIndex.value].active ?? 0);
  }

  getPercentDeathsBetweenDays(
      {@required int initDate, @required int finalDate}) {
    finalDate = finalDate == 0 ? 1 : finalDate;
    percentDeaths.value =
        ((initDate - finalDate) / finalDate * 100).toDouble().toPrecision(2);
  }

  getPercentConfirmedBetweenDays(
      {@required int initDate, @required int finalDate}) {
    finalDate = finalDate == 0 ? 1 : finalDate;
    percentConfirmed.value =
        ((initDate - finalDate) / finalDate * 100).toDouble().toPrecision(2);
  }

  getPercentRecoveredBetweenDays(
      {@required int initDate, @required int finalDate}) {
    finalDate = finalDate == 0 ? 1 : finalDate;
    percentRecovered.value =
        ((initDate - finalDate) / finalDate * 100).toDouble().toPrecision(2);
  }

  getPercentActiveBetweenDays(
      {@required int initDate, @required int finalDate}) {
    finalDate = finalDate == 0 ? 1 : finalDate;
    percentActive.value =
        ((initDate - finalDate) / finalDate * 100).toDouble().toPrecision(2);
  }

  getDifferenceDeathsBetweenDays(
      {@required int initDate, @required int finalDate}) {
    var difference = (initDate - finalDate);
    if (difference > 0) {
      differenceDeathsBetweenDays.value = '+${difference.toString()}';
    } else if (difference == 0) {
      differenceDeathsBetweenDays.value = '${difference.toString()}';
    } else {
      differenceDeathsBetweenDays.value = '${difference.toString()}';
    }
  }

  getDifferenceConfirmedBetweenDays(
      {@required int initDate, @required int finalDate}) {
    var difference = (initDate - finalDate);
    if (difference > 0) {
      differenceConfirmedBetweenDays.value = '+${difference.toString()}';
    } else if (difference == 0) {
      differenceConfirmedBetweenDays.value = '${difference.toString()}';
    } else {
      differenceConfirmedBetweenDays.value = '${difference.toString()}';
    }
    if (difference > 2500) {
      riskOfContagion.value = 'serious';
      riskOfContagionColor.value = AppColors.appRed;
    } else if (difference > 1000 && difference <= 2500) {
      riskOfContagion.value = 'high_risk';
      riskOfContagionColor.value = AppColors.appOrange;
    } else if (difference > 200 && difference <= 1000) {
      riskOfContagion.value = 'high';
      riskOfContagionColor.value = AppColors.appBlue;
    } else {
      riskOfContagion.value = 'moderate';
      riskOfContagionColor.value = AppColors.appGreen;
    }
  }

  getDifferenceRecoveredBetweenDays(
      {@required int initDate, @required int finalDate}) {
    var difference = (initDate - finalDate);
    if (difference > 0) {
      differenceRecoveredBetweenDays.value = '+${difference.toString()}';
    } else if (difference == 0) {
      differenceRecoveredBetweenDays.value = '${difference.toString()}';
    } else {
      differenceRecoveredBetweenDays.value = '${difference.toString()}';
    }
  }

  getDifferenceActiveBetweenDays(
      {@required int initDate, @required int finalDate}) {
    var difference = (initDate - finalDate);
    if (difference > 0) {
      differenceActiveBetweenDays.value = '+${difference.toString()}';
    } else if (difference == 0) {
      differenceActiveBetweenDays.value = '${difference.toString()}';
    } else {
      differenceActiveBetweenDays.value = '${difference.toString()}';
    }
  }

  String getFlagCountryList() {
    _countryDetailsList.where((element) {
      if (element.locale.en.contains(myCountryList[0].country)) {
        countryFlag = element.flag;
      }
      return element.locale.en
          .toLowerCase()
          .contains(myCountryList[0].country ?? 'Brazil');
    }).toList();
    return countryFlag.isNotEmpty ? countryFlag : '';
  }

  _initCountryDetailsModel() async {
    var jsonString = await rootBundle.loadString('assets/jsons/countries.json');
    var json = jsonDecode(jsonString);
    _countryDetailsList.clear();
    if (json.toString().isNotEmpty) {
      for (Map<String, dynamic> item in json) {
        _countryDetailsList.add(
          CountryDetailsModel.fromJson(item),
        );
      }
    }

    _countryDetailsList.sort((b, a) =>
        removeDiacritics(b.locale.pt).compareTo(removeDiacritics(a.locale.pt)));
  }

  incDay() {
    if (initIndex > 0) {
      initIndex.value--;
      finalIndex.value--;
      getAllDifferences();
      getAllPercents();
    }
  }

  subDay() {
    if (finalIndex < myCountryList.length) {
      initIndex.value++;
      finalIndex.value++;
      getAllDifferences();
      getAllPercents();
    }
  }

  onTapStatitics() {
    Get.toNamed(AppPages.statistics, arguments: myCountryList);
  }

  onTap(BuildContext context) async {
    try {
      String path = await NativeScreenshot.takeScreenshot();
      List<String> imagePaths = [];
      imagePaths.add(path);
      if (path == null || path.isEmpty) {
        Get.snackbar('Erro', 'Error taking the screenshot :(');
        print('Error taking the screenshot :(');
        return;
      }
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.shareFiles(imagePaths,
          text: 'Imagem',
          subject: 'Teste',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      print('Erro>>> ${e.toString()}');
      Get.snackbar('Erro', e.toString());
    }
  }
}
