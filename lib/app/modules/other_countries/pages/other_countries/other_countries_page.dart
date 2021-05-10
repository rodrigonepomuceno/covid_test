import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/app/modules/other_countries/pages/other_countries/other_countries_controller.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:covid19/app/shared/widgets/app_list_tile.dart';
import 'package:covid19/app/shared/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCountriesPage extends GetView<OtherCountriesController> {
  final isProfile;

  OtherCountriesPage({@required this.isProfile});

  @override
  Widget build(BuildContext context) {
    controller.isProfile = isProfile;
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        appBar: isProfile
            ? AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    InkWell(
                      onTap: controller.backPage,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: controller.pageState.value == Behaviour.regular
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      AppSearchBar(
                        onChanged: controller.setSearchText,
                        onSuffixTap: controller.clearSearchText,
                        hintText: 'Pesquisar',
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.filteredCountryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AppListTile(
                              onTap: () => controller.onTapItemList(
                                  otherCountries:
                                      controller.filteredCountryList[index]),
                              hasBotDivider: true,
                              body: Text(
                                controller.filteredCountryList[index].country,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 1,
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.2),
                                  ),
                                ),
                                height: 30,
                                width: 45,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "https://flagpedia.net/data/flags/normal/${controller.filteredCountryList[index].countryCode.toLowerCase()}.png",
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/noflag.png',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
