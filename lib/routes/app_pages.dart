import 'package:covid19/app/modules/default_my_country/default_my_country_page.dart';
import 'package:covid19/app/modules/home/home_bindings.dart';
import 'package:covid19/app/modules/home/home_page.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_bindings.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries_details/other_countries_details_bindings.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries_details/other_countries_details_page.dart';
import 'package:covid19/app/modules/statistics/statistics_bindings.dart';
import 'package:covid19/app/modules/statistics/statistics_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const home = '/home';
  static const outherCountriesDetails = '/outherCountriesDetails';
  static const defaultMyCountry = '/defaultMyCountry';
  static const statistics = '/statistics';

  static final homePage = GetPage(
    name: home,
    page: () => HomePage(),
    binding: HomeBindings(),
    transition: Transition.native,
  );
  static final outherCountriesDetailsPage = GetPage(
    name: outherCountriesDetails,
    page: () => OtherCountriesDetailsPage(),
    binding: OtherCountriesDetailsBindings(),
    transition: Transition.native,
  );

  static final defaultMyCountryPage = GetPage(
    name: defaultMyCountry,
    page: () => DefaultMyCountryPage(),
    binding: OtherCountriesBindings(),
    transition: Transition.native,
  );

  static final statisticsPage = GetPage(
    name: statistics,
    page: () => StatisticsPage(),
    binding: StatisticsBindings(),
    transition: Transition.native,
  );

  static final getPagesList = [
    homePage,
    outherCountriesDetailsPage,
    defaultMyCountryPage,
    statisticsPage,
  ];
}
