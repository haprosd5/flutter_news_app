import 'dart:convert';

import 'package:project_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  Future<List<ArticleModel>> getTopArticleFromUs(String country) async {
    List<ArticleModel> news = [];
    var response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=ebe40e51702242b28b94b1fbd53f28c5');
    try {
      final result = jsonDecode(response.body);
      if (result['status'] == "ok") {
        result['articles'].forEach((item) {
          ArticleModel temp;
          if (item['urlToImage'] != null && item['title'] != null) {
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

  Future<List<ArticleModel>> getNewsCategory(String cate) async {
    List<ArticleModel> news = [];
    var response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=de&category=$cate&apiKey=ebe40e51702242b28b94b1fbd53f28c5');
    try {
      final result = jsonDecode(response.body);
      if (result['status'] == "ok") {
        result['articles'].forEach((item) {
          ArticleModel temp;
          if (item['urlToImage'] != null && item['title'] != null) {
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

class NetworkError extends Error {}
