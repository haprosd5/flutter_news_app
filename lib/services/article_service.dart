import 'dart:convert';

import 'package:project_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

final urlCountry = (String country) =>
    'https://newsapi.org/v2/top-headlines?country=$country&apiKey=ebe40e51702242b28b94b1fbd53f28c5';

class News {
  List<ArticleModel> news = [];

  Future<void> getTopArticleFromUs(String country) async {
    var response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=ebe40e51702242b28b94b1fbd53f28c5');
    try {
      final result = jsonDecode(response.body);
      if (result['status'] == "ok") {
        result['articles'].forEach((item) {
          ArticleModel temp;
          if (item['url'] != null) {
            temp = new ArticleModel(
              title: item['title'],
              url: item['url'],
              author: item['author'],
              content: item['content'],
              description: item['description'],
              urlToImage: item['urlToImage'],
            );
            news.add(temp);
          }
        });
      }
      return news;
    } catch (Exception) {
      throw Exception('Bi loi roi');
    }
  }
}
