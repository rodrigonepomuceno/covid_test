import 'package:covid19/app/shared/models/other_countries_model.dart';
import 'package:get/get_connect/connect.dart';

class OtherCountriesRepository extends GetConnect {
  Future<List<OtherCountriesModel>> getCountries() async {
    try {
      final String url = 'https://api.covid19api.com/summary';

      var response = await get(url);

      List<OtherCountriesModel> listCountries = [];

      if (response.body['Countries'] != null) {
        listCountries.addAll(response.body['Countries']
            .map<OtherCountriesModel>(
                (json) => OtherCountriesModel.fromJson(json))
            .toList());
      }
      return listCountries;
    } catch (e) {
      print('Error load getMyCountry');
      return [];
    }
  }
}
