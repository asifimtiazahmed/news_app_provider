import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/web_service.dart';
import 'news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles =
        newsArticles.map((article) => NewsArticleViewModel(article)).toList();
    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
