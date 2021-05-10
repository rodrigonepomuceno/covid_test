import 'package:covid19/app/modules/news/news_controller.dart';

import 'package:covid19/app/shared/repositories/news/new_repository.dart';

import 'package:get/get.dart';

class NewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsRepository());
    Get.lazyPut<NewsController>(
        () => NewsController(newsRepository: Get.find()));
  }
}
