import 'package:news_app/models/news_article.dart';

class NewsArticleViewModel {
  late NewsArticle _newsArticle;

  NewsArticleViewModel(NewsArticle article) : _newsArticle = article;

  String get title => _newsArticle.title;

  String get author => _newsArticle.author;

  String get description => _newsArticle.description;

  String get urlToImge => _newsArticle.urlToImage;

  String get url => _newsArticle.url;

  String get content => _newsArticle.content;

  String get publishedAt => _newsArticle.publishedAt;
}
