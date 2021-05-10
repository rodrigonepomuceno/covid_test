import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_page.dart';
import 'package:flutter/material.dart';

class DefaultMyCountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OtherCountriesPage(isProfile: true);
  }
}
