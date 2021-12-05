import 'package:flutter/material.dart';
import 'package:flutter_architcture_one/view/home_page/home_page_view.dart';
import 'package:flutter_architcture_one/view/home_page/home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key })
    : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _model = HomePageModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _model,
      builder: (_, HomePageData data, __) =>
        HomePageView(data: data)
    );
  }

  @override
  void initState() {
    super.initState();
    _model.getArticles();
  }
}
