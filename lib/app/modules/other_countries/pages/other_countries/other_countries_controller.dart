import 'package:covid19/app/modules/my_country/my_country_controller.dart';
import 'package:covid19/app/shared/models/other_countries_model.dart';
import 'package:covid19/app/shared/repositories/other_countries/other_countries_repository.dart';
import 'package:covid19/app/shared/services/local_storage_controller.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:covid19/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCountriesController extends GetxController {
  final OtherCountriesRepository repository;
  final LocalStorageController localStorageController;
  final MyCountryController myCountryController;

  RxList<OtherCountriesModel> countriesList = <OtherCountriesModel>[].obs;
  var pageState = Behaviour.regular.obs;
  var searchText = ''.obs;
  var argument = Get.arguments ?? false;
  var slug = '';
  var isProfile = false;
  OtherCountriesController({
    @required this.repository,
    @required this.localStorageController,
    @required this.myCountryController,
  });

  @override
  void onInit() {
    getContries();
    print('OtherCountriesController onInit');
    super.onInit();
  }

  getContries() async {
    try {
      pageState.value = Behaviour.loading;

      var response = await repository.getCountries();
      countriesList.addAll(response);
      pageState.value = Behaviour.regular;
    } catch (e) {
      print('Error>>> OtherCountriesController.getContries');
    }
  }

  void setSearchText(String value) {
    searchText.value = value;
  }

  void clearSearchText() {
    searchText.value = '';
  }

  List<OtherCountriesModel> get filteredCountryList {
    if (searchText.value.length >= 2) {
      return countriesList
          .where(
              (element) => element.country.toLowerCase().contains(searchText))
          .toList();
    }
    return countriesList;
  }

  onTapItemList({OtherCountriesModel otherCountries}) {
    switch (isProfile) {
      case true:
        localStorageController.setDefaultCountry(otherCountries.slug);
        myCountryController.getMyCountry();
        backPage();
        break;
      case false:
        Get.toNamed(
          AppPages.outherCountriesDetails,
          arguments: otherCountries.slug,
        );
        break;
      default:
        Get.snackbar('Error', 'Error');
    }
  }

  backPage() {
    Get.back();
  }
}
