import 'package:covid19/app/shared/models/news_model.dart';
import 'package:get/get_connect/connect.dart';

class NewsRepository extends GetConnect {
  Future<List<NewsModel>> getNews() async {
    try {
      final String url =
          'https://api.currentsapi.services/v1/search?domain=zdnet.com&keywords=covid&language=en';

      var response = await get(url, headers: {
        'Authorization': 'kPqPJ05LqL6ZhjFqg6N1lpSji4GxW41fXKA9cqYM2nzJq00V',
        'cache-control': 'no-cache'
      });

      List<NewsModel> listNews = [];

      if (response.body['news'] != null) {
        listNews.addAll(response.body['news']
            .map<NewsModel>((json) => NewsModel.fromJson(json))
            .toList());
      }
      return listNews;
    } catch (e) {
      print('Error load getNews');
      return [];
    }
  }
}
