import 'package:covid19/app/shared/models/contry_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';

class MyCountryRepository extends GetConnect {
  Future<List<CountryModel>> getMyCountry({@required String myCountry}) async {
    try {
      final String url = 'https://api.covid19api.com/total/country/$myCountry';

      var response = await get(url);

      List<CountryModel> listMyCountry = [];

      if (response.body != null) {
        listMyCountry.addAll(response.body
            .map<CountryModel>((json) => CountryModel.fromJson(json))
            .toList());
      }
      return listMyCountry.reversed.toList();
    } catch (e) {
      print('Error load getMyCountry');
      return [];
    }
  }
}
