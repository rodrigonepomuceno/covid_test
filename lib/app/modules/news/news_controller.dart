import 'package:covid19/app/shared/models/news_model.dart';
import 'package:covid19/app/shared/repositories/news/new_repository.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsController extends GetxController {
  final NewsRepository newsRepository;
  RxList<NewsModel> newsList = <NewsModel>[].obs;
  var pageState = Behaviour.regular.obs;

  NewsController({@required this.newsRepository});

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  getNews() async {
    try {
      pageState.value = Behaviour.loading;
      var result = await newsRepository.getNews();
      newsList.addAll(result);
      pageState.value = Behaviour.regular;
    } catch (e) {
      print('Erro NewsController.getNews $e');
    }
  }

  onTap({@required String link}) async {
    if (await canLaunch(link)) {
      await launch(link);
      return true;
    } else {
      print('Could not launch $link');
      return false;
    }
  }
}
