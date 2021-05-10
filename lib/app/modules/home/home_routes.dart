import 'package:covid19/app/modules/my_country/my_country_bindings.dart';
import 'package:covid19/app/modules/my_country/my_country_page.dart';
import 'package:covid19/app/modules/news/news_bindings.dart';
import 'package:covid19/app/modules/news/news_page.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_bindings.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_page.dart';
import 'package:covid19/app/modules/profile/profile_bindings.dart';
import 'package:covid19/app/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoutes {
  HomeRoutes._();

  static const myCountry = '/my_country';
  static const otherCountries = '/other_countries';
  static const profile = '/profile';
  static const news = '/news';

  static get getRoutesNames => [
        otherCountries,
        myCountry,
        profile,
        news,
      ];

  static myCountryRoute(RouteSettings settings) => GetPageRoute(
        settings: settings,
        page: () => MyCountryPage(),
        binding: MyCountryBindings(),
        transition: Transition.fadeIn,
      );

  static otherCountriesRoute(RouteSettings settings) => GetPageRoute(
        settings: settings,
        page: () => OtherCountriesPage(isProfile: false),
        binding: OtherCountriesBindings(),
        transition: Transition.fadeIn,
      );

  static profileRoute(RouteSettings settings) => GetPageRoute(
        settings: settings,
        page: () => ProfilePage(),
        binding: ProfilesBindings(),
        transition: Transition.fadeIn,
      );

  static newsRoute(RouteSettings settings) => GetPageRoute(
        settings: settings,
        page: () => NewsPage(),
        binding: NewsBindings(),
        transition: Transition.fadeIn,
      );

  static Route onGenerateRoute(RouteSettings settings) {
    var route = {
      myCountry: myCountryRoute(settings),
      otherCountries: otherCountriesRoute(settings),
      profile: profileRoute(settings),
      news: newsRoute(settings),
    };

    return route[settings.name];
  }
}
