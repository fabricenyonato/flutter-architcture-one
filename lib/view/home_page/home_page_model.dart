import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architcture_one/model/article.dart';
import 'package:flutter_architcture_one/view/common/data_state.dart';
import 'package:flutter_architcture_one/repository/space_flight_news_repository.dart' as repository;

class HomePageData {
  final DataState<List<Article>> articles;

  const HomePageData({
    this.articles = const DataState.success([]),
  });

  HomePageData copyWith({
    DataState<List<Article>>? articles,
  }) =>
    HomePageData(
      articles: articles ?? this.articles,
    );
}

class HomePageModel extends ValueNotifier<HomePageData> {
  HomePageModel([HomePageData value = const HomePageData()])
    : super(value);

  set _articles(DataState<List<Article>> articles) =>
    value = value.copyWith(articles: articles);

  void getArticles() {
    _articles = const DataState.loading();

    repository.articles()
      .then((articles) => _articles = DataState.success(articles))
      .catchError((error) => _articles = DataState.error(error));
  }
}
