import 'dart:convert';

import 'package:flutter_architcture_one/model/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> articles() {
  var url = Uri.parse('https://api.spaceflightnewsapi.net/v3/articles');

  return http.get(url)
    .then((r) {
      if (r.statusCode != 200) throw r;

      final body = jsonDecode(r.body) as List;

      return body
        .map((e) {
          return Article(
            title: e['title'],
            summary: e['summary'],
            image: e['imageUrl'],
          );
        })
        .toList();
    });
}
