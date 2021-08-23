import 'package:dio/dio.dart';
import 'package:news_app/models/news_article.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=dfff4da29e824f12a9b9d36b7097cce0';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('failed to get top news');
    }
  }
}
