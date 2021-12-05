import 'package:flutter/material.dart';
import 'package:flutter_architcture_one/model/article.dart';
import 'package:flutter_architcture_one/view/common/data_state.dart';
import 'package:flutter_architcture_one/view/home_page/home_page_model.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({ Key? key }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({ Key? key }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({ Key? key, required this.article })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cover = Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
          image: article.image == null ? null : DecorationImage(
            image: NetworkImage(article.image!),
            fit: BoxFit.cover,
          )
        ),
      ),
    );

    final title = Text(
      article.title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );

    final summary = Text(
      article.summary,
      style: const TextStyle(
        fontSize: 16,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* if (article.cover != null)  */cover,
          title,
          const SizedBox(height: 2),
          summary,
        ],
      ),
    );
  }
}

class SuccessView extends StatelessWidget {
  final List<Article> articles;

  const SuccessView({ Key? key, required this.articles }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (final article in articles)
            ArticleView(article: article)
        ],
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  final HomePageData data;

  const HomePageView({
    Key? key,
    required this.data,
  }):
    super(key: key);

  DataState<List<Article>> get _articles => data.articles;

  @override
  Widget build(BuildContext context) {
    if (_articles.isLoading) return const LoadingView();
    if (_articles.isError) return const ErrorView();

    return SuccessView(articles: _articles.data!);
  }
}
