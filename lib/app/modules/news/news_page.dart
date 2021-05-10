import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/app/modules/news/news_controller.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:covid19/app/shared/widgets/app_sized_height.dart';
import 'package:covid19/app/shared/widgets/app_sized_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.pageState.value == Behaviour.regular
            ? ListView.builder(
                itemCount: controller.newsList.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () =>
                        controller.onTap(link: controller.newsList[index].url),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              controller.newsList[index].title,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSizedHeight(
                              value: 10,
                            ),
                            Row(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: controller.newsList[index].image,
                                  height: 50,
                                  width: 50,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/noflag.png',
                                  ),
                                ),
                                AppSizedWidth(value: 10),
                                Expanded(
                                  child: Text(
                                    controller.newsList[index].description,
                                    maxLines: 5,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            AppSizedHeight(
                              value: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
